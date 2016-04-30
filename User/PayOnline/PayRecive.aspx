<%@ Page Language="C#" MasterPageFile="~/User/UserNoLogin.master" AutoEventWireup="true" Inherits="Kesion.NET.WebSite.User_PayOnline_Receive" Title="֧�����" Codebehind="PayRecive.aspx.cs" %>
<%@ Import Namespace="Kesion.Cache" %>
<%@ Import Namespace="Kesion.Publics" %>
<%@ Import Namespace="Kesion.BLL" %>
<%@ Import Namespace="Kesion.Components" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="KSContent" Runat="Server">

    <br /><br /><br />
<table class="border" cellSpacing="1" cellPadding="2" width="60%" align="center" border="0">
  <tr class="title"> 
    <td><b><font color="#FF0000">��ܰ��ʾ��</font> ����������֧������������£�</b></td>
 </tr>
 <tr class="tdbg"><td height="45">
      <p>
        <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
	  </p>
     </td>
  </tr>
  <tr class="title">
   <td  height="22" align="center"><a href="../index.aspx">�����Ա����</a> | <a href="../../">������ҳ</a>
   </td>
  </tr>
</table>

<script runat="server">
    string payOnlineShopID;
    string PayOnlineKey;
    PlatFormInfo payPlatform;
    StringBuilder message = new StringBuilder();
protected void Page_Load(object sender, EventArgs e)
 {
        int payPlatformId = Utils.StrToInt(KSCMS.S("PaymentPlat"),1);  //֧���ӿ�
        payPlatform = PlatForm.GetPlatFormById(payPlatformId);
        payOnlineShopID = payPlatform.AccountID;
        PayOnlineKey = payPlatform.Md5Key;
       // Page.Request.ContentEncoding = Encoding.GetEncoding("gb2312");
        switch (payPlatformId)
        {
            case 1: //��������֧��
                ChainBank();
                break;
            case 10: //�Ƹ�ͨ��ʱ����
            case 11: //�Ƹ�ͨ����
            case 13: //�Ƹ�ͨ˫�ӿ�
                TenPay();
                break;
            case 8: //֧������ʱ����
            case 9:
            case 12:
                AliPay();
                break;
        }
}
/// <summary>
/// �Ƹ�ͨ
/// </summary>
private void TenPay()
{        
    //����ResponseHandlerʵ��
    ResponseHandler resHandler = new ResponseHandler(Context);
    resHandler.setKey(PayOnlineKey);

    //�ж�ǩ��
    if (resHandler.isTenpaySign())
    {

        ///֪ͨid
        string notify_id = resHandler.getParameter("notify_id");
        //�̻�������
        string out_trade_no = resHandler.getParameter("out_trade_no");
        //�Ƹ�ͨ������
        string transaction_id = resHandler.getParameter("transaction_id");
        //���,�Է�Ϊ��λ
        double total_fee = Convert.ToDouble(resHandler.getParameter("total_fee"));
        total_fee = total_fee / 100;
        
        //�����ʹ���ۿ�ȯ��discount��ֵ��total_fee+discount=ԭ�����total_fee
        string discount = resHandler.getParameter("discount");
        //֧�����
        string trade_state = resHandler.getParameter("trade_state");
        //����ģʽ��1��ʱ���ˣ�2�н鵣��
        string trade_mode = resHandler.getParameter("trade_mode");

        if ("1".Equals(trade_mode))
        {       //��ʱ���� 
            if ("0".Equals(trade_state))
            {

                PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, out_trade_no, Utils.StrToFloat(total_fee), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName));
                if (KSCMS.S("from")=="shop")
                {
                    Kesion.APPCode.OrderProcess.PaySuccessSendNewOrderTips(out_trade_no); //��������ɹ����ѹ���Ա
                    string orderTipsTp = Kesion.APPCode.OrderProcess.GetOrderPaySuccessTips(out_trade_no);  //�ύ����������״̬�õ���ʾ��Ϣ
                    message.Append(orderTipsTp);

                    
                    
                    /*message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paysuccess"));
                    if (new TemporaryVar().FromPage == "3g")
                    {
                        
                        Response.Redirect("../../"+MyCache.GetCacheConfig(73)+"/order.aspx");
                    }
                    else
                    {
                        Response.Redirect("../shop/myorder.aspx");
                    }*/
                }
                else
                {
                    message.AppendFormat(Utils.GetLanguageNode("//language/node[@name='user']/payonline/allowmoney"), UserManage.GetUserInfo((new TemporaryVar()).UserName).Money);

                }

               // Response.Write("��ʱ���ʸ���ɹ�");
                //���Ƹ�ͨϵͳ���ͳɹ���Ϣ���Ƹ�ͨϵͳ�յ��˽�����ٽ��к���֪ͨ

            }
            else
            {
                message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payerror"));
                //Response.Write("��ʱ����֧��ʧ��");
            }

        }
        else if ("2".Equals(trade_mode))
        {  
            
            //�н鵣��
            if ("0".Equals(trade_state))
            {

                OrderProcess.UpdateOrderByWAIT_SELLER_SEND_GOODS(out_trade_no, Utils.StrToFloat(total_fee), transaction_id, "WAIT_SELLER_SEND_GOODS", payPlatform.ID);

                message.Append("�н鵣������ɹ�");
                //���Ƹ�ͨϵͳ���ͳɹ���Ϣ���Ƹ�ͨϵͳ�յ��˽�����ٽ��к���֪ͨ

            }
            else
            {
               message.Append("����״̬��trade_state=" + trade_state);
            }
        }
    }
    else
    {
       // Response.Write("��֤ǩ��ʧ��");
    }

    //��ȡdebug��Ϣ,�����debug��Ϣд����־�����㶨λ����
    string debuginfo = resHandler.getDebugInfo();
    if (string.IsNullOrEmpty(message.ToString()))
    {
        message.Append(debuginfo);
    }

    if (new TemporaryVar().FromPage == "3g")
    {
        KSCMS.Die("<script>alert('" + Utils.RemoveHtml(message.ToString()).Replace("'", "\'") + "');location.href='../../" + MyCache.GetCacheConfig(73) + "/user.aspx';</" + "script>");
    }
    else
    {
        LblMsg.Text = message.ToString();
    }



} 
    
/// <summary>
/// ֧����
/// </summary>
private void AliPay()
{
    string partner = string.Empty;
    if (PayOnlineKey.IndexOf("|") > 0)
    {
        string[] ArrMD5Key = PayOnlineKey.Split(new char[] { '|' });
        PayOnlineKey = ArrMD5Key[0];
        partner = ArrMD5Key[1];
    }

    SortedDictionary<string, string> sPara = GetRequestGet();
    if (sPara.Count > 0)//�ж��Ƿ��д����ز���
    {

        AlipayNotify aliNotify = new AlipayNotify(partner, PayOnlineKey);
        bool verifyResult = aliNotify.Verify(sPara, Request.QueryString["notify_id"], Request.QueryString["sign"]);
       

        if (verifyResult)//��֤�ɹ�
        {
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            //������������̻���ҵ���߼��������

            //�������������ҵ���߼�����д�������´�������ο�������
            //��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�
            string trade_no = Utils.ChkSQL(Request.QueryString["trade_no"]);              //֧�������׺�
            string order_no = Utils.ChkSQL(Request.QueryString["out_trade_no"]);	        //��ȡ������
            string total_fee = Request.QueryString["total_fee"];            //��ȡ�ܽ��
            string subject = Request.QueryString["subject"];                //��Ʒ���ơ���������
            string body = Request.QueryString["body"];                      //��Ʒ������������ע������
            string buyer_email = Request.QueryString["buyer_email"];        //���֧�����˺�
            string trade_status = Utils.ChkSQL(Request.QueryString["trade_status"]);      //����״̬

            if (Request.QueryString["trade_status"] == "TRADE_FINISHED" || Request.QueryString["trade_status"] == "TRADE_SUCCESS")
            {  //��ʱ����

                PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, order_no, Utils.StrToFloat(total_fee), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName));
 
                //�жϸñʶ����Ƿ����̻���վ���Ѿ���������
                //���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
                //���������������ִ���̻���ҵ�����
            }
            else if (Request.QueryString["trade_status"] == "WAIT_SELLER_SEND_GOODS") //�Ǽ�ʱ���ˣ��ȴ�����
            {
                OrderProcess.UpdateOrderByWAIT_SELLER_SEND_GOODS(order_no, Utils.StrToFloat(total_fee), trade_no, trade_status, payPlatform.ID);
                
            }


            if (KSCMS.S("from") == "shop")
            {
			    Kesion.APPCode.OrderProcess.PaySuccessSendNewOrderTips(order_no); //��������ɹ����ѹ���Ա
                string orderTipsTp = Kesion.APPCode.OrderProcess.GetOrderPaySuccessTips(order_no);  //�ύ����������״̬�õ���ʾ��Ϣ
                message.Append(orderTipsTp);
                
               // message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paysuccess"));
               /* if (new TemporaryVar().FromPage == "3g")
                {

                    Response.Redirect("../../" + MyCache.GetCacheConfig(73) + "/order.aspx");
                }
                else
                {
                    Response.Redirect("../shop/myorder.aspx");
                }*/
            }
            else
            {
                message.AppendFormat(Utils.GetLanguageNode("//language/node[@name='user']/payonline/allowmoney"), UserManage.GetUserInfo((new TemporaryVar()).UserName).Money);

            }
            

            //��ӡҳ��
            //Response.Write("��֤�ɹ�<br />");

            //�������������ҵ���߼�����д�������ϴ�������ο�������

            /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        }
        else//��֤ʧ��
        {
            message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payerror"));

        }
    }
    else
    {
        message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paynobackparam"));
    }

    if (new TemporaryVar().FromPage == "3g")
    {
        KSCMS.Die("<script>alert('" + Utils.RemoveHtml(message.ToString()).Replace("'", "\'") + "');location.href='../../" + MyCache.GetCacheConfig(73) +"/user.aspx';</"+"script>");
    }
    else
    {
        LblMsg.Text = message.ToString();
    }

}   
 private void ChainBank(){ //����
       string v_mid, v_oid, v_pmode, v_pstatus, v_pstring, v_amount, v_md5, v_moneytype;
    
        v_mid = payOnlineShopID;
        v_oid = Utils.Trim(Request["v_oid"]);
        v_md5 = Utils.Trim(Request["v_md5str"]);            //����ǩ��
        v_amount = Utils.Trim(Request["v_amount"]);         //֧�����
        v_pstatus = Utils.Trim(Request["v_pstatus"]);       //֧��״̬
        v_moneytype = Utils.Trim(Request["v_moneytype"]);   //֧������
        v_pmode = Utils.Trim(Request["v_pmode"]);           //֧������
        v_pstring = Utils.Trim(Request["v_pstring"]);       //֧�����˵��

    string md5string = Utils.MD5(v_oid + v_pstatus + v_amount + v_moneytype + PayOnlineKey);

        StringBuilder message = new StringBuilder();
        if (md5string.ToUpper() == v_md5.ToUpper() && v_pstatus == "20")
        {
            PlatForm.UpdateUserMoney((new TemporaryVar()).UserName, v_oid, Convert.ToDouble(v_amount), string.Format(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payremark"), payPlatform.PlatName));

            if (KSCMS.S("from") == "shop")
            {
                Kesion.APPCode.OrderProcess.PaySuccessSendNewOrderTips(v_oid); //��������ɹ����ѹ���Ա

                string orderTipsTp = Kesion.APPCode.OrderProcess.GetOrderPaySuccessTips(v_oid);  //�ύ����������״̬�õ���ʾ��Ϣ
                message.Append(orderTipsTp);

                /*
                message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/paysuccess"));
                if (new TemporaryVar().FromPage == "3g")
                {

                    Response.Redirect("../../" + MyCache.GetCacheConfig(73) + "/order.aspx");
                }
                else
                {
                    Response.Redirect("../shop/myorder.aspx");
                }*/
            }
            else
            {
                message.AppendFormat(Utils.GetLanguageNode("//language/node[@name='user']/payonline/allowmoney"), UserManage.GetUserInfo((new TemporaryVar()).UserName).Money);

            }
        }
        else
        {
            message.Append(Utils.GetLanguageNode("//language/node[@name='user']/payonline/payerror"));
        }

        if (new TemporaryVar().FromPage == "3g")
        {
            KSCMS.Die("<script>alert('" + Utils.RemoveHtml(message.ToString()).Replace("'", "\'") + "');location.href='../../" + MyCache.GetCacheConfig(73) + "/user.aspx';</" + "script>");
        }
        else
        {
            LblMsg.Text = message.ToString();
        }
    }

 /// <summary>
 /// ��ȡ֧����GET����֪ͨ��Ϣ�����ԡ�������=����ֵ������ʽ�������
 /// </summary>
 /// <returns>request��������Ϣ��ɵ�����</returns>
 public SortedDictionary<string, string> GetRequestGet()
 {
     int i = 0;
     SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
     NameValueCollection coll;
     //Load Form variables into NameValueCollection variable.
     coll = Request.QueryString;

     // Get names of all forms into a string array.
     String[] requestItem = coll.AllKeys;

     for (i = 0; i < requestItem.Length; i++)
     {
         
         
         sArray.Add(requestItem[i], Request.QueryString[requestItem[i]]);
     }

     return sArray;
 }
</script>
    
</asp:Content>