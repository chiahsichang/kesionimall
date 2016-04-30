<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KeyBoardControl.ascx.cs" Inherits="Kesion.NET.WebSite.KeyBoardControl" %>
<%@ Import Namespace="Kesion.Publics" %>
<script>
    function showKeyBoard(obj) {
        $("#keycontainer").show();
        var top = $('#' + obj.id).offset().top;
        var left = $('#' + obj.id).offset().left;
      // $("#keycontainer").css("left", left-150);
      //  $("#keycontainer").css("top", top - 75);

        $("#keyboard").empty().html($("#keybtn").html());
        var $write = $('#'+obj.id),
		shift = false,
		capslock = false;
        $('#keyboard li').click(function () {
            var $this = $(this);
            var character = $this.html(); // If it's a lowercase letter, nothing happens to this variable
            // Shift keys
            if ($this.hasClass('left-shift') || $this.hasClass('right-shift')) {
                $('.letter').toggleClass('uppercase');
                $('.symbol span').toggle();

                shift = (shift === true) ? false : true;
                capslock = false;
                return false;
            }

            // Caps lock
            if ($this.hasClass('capslock')) {
                $('.letter').toggleClass('uppercase');
                capslock = true;
                return false;
            }

            // Delete
            if ($this.hasClass('delete')) {
                var html = $write.val();
                $write.val(html.substr(0, html.length - 1));
                return false;
            }

            // Special characters
            if ($this.hasClass('symbol')) character = $('span:visible', $this).html();
            if ($this.hasClass('space')) character = ' ';
            if ($this.hasClass('tab')) character = "\t";
            //if ($this.hasClass('return')) character = "\n";
            if ($this.hasClass('return')) {
                $('#keycontainer').hide();
                return;
            }



            // Uppercase letter
            if ($this.hasClass('uppercase')) character = character.toUpperCase();

            // Remove shift once a key is clicked.
            if (shift === true) {
                $('.symbol span').toggle();
                if (capslock === false) $('.letter').toggleClass('uppercase');

                shift = false;
            }
            if ($write.val()=='******') $write.val('');
            // Add the character
            $write.val($write.val() + character);
        });


    }
</script>
<style>
#keycontainer {
position:absolute; left:0px; top:0px; z-index:180;
display:none;
margin: 38px auto;
width: 516px;
border:1px solid #ccc;
height:194px;
padding-left:3px;
padding-top:3px;
background-color:#f1f1f1;
}
#keytitle{text-align:center;height:22px;line-height:22px;font-weight:bold;}
#keyboard {
margin: 0;
padding: 0;
list-style: none;
}
#keyboard li {
	float: left;
	margin: 0 2px 2px 0;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	background: #fff;
	border: 1px solid #f9f9f9;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	}
.capslock, .tab, .left-shift {
		clear: left;
		}
			#keyboard .tab, #keyboard .delete {
			width: 70px;
			}
			#keyboard .capslock {
			width: 80px;
			}
			#keyboard .return {
			width: 53px;
			}
			#keyboard .left-shift {
			width: 95px;
			}
			#keyboard .right-shift {
			width: 72px;
			}
		.lastitem {
		margin-right: 0;
		}
		.uppercase {
		text-transform: uppercase;
		}
		#keyboard .space {
		clear: left;
		width: 510px;
		}
		.on {
		display: none;
		}
		#keyboard li:hover {
		position: relative;
		top: 1px;
		left: 1px;
		border-color: #e5e5e5;
		cursor: pointer;
		}
</style>

<div id="keycontainer">
   <div id="keytitle"><span style="float:right;padding-right:10px;cursor:pointer" onclick="$('#keycontainer').hide();">[close]</span>===KesionICMS »Ìº¸≈Ã===</div>
	<ul id="keyboard">
    </ul>
    <ul id="keybtn" style="display:none">
		<li class="symbol"><span class="off">`</span><span class="on">~</span></li>
		<li class="symbol"><span class="off">1</span><span class="on">!</span></li>
		<li class="symbol"><span class="off">2</span><span class="on">@</span></li>
		<li class="symbol"><span class="off">3</span><span class="on">#</span></li>
		<li class="symbol"><span class="off">4</span><span class="on">$</span></li>
		<li class="symbol"><span class="off">5</span><span class="on">%</span></li>
		<li class="symbol"><span class="off">6</span><span class="on">^</span></li>
		<li class="symbol"><span class="off">7</span><span class="on">&amp;</span></li>
		<li class="symbol"><span class="off">8</span><span class="on">*</span></li>
		<li class="symbol"><span class="off">9</span><span class="on">(</span></li>
		<li class="symbol"><span class="off">0</span><span class="on">)</span></li>
		<li class="symbol"><span class="off">-</span><span class="on">_</span></li>
		<li class="symbol"><span class="off">=</span><span class="on">+</span></li>
		<li class="delete lastitem">delete</li>
		<li class="tab">tab</li>
		<li class="letter">q</li>
		<li class="letter">w</li>
		<li class="letter">e</li>
		<li class="letter">r</li>
		<li class="letter">t</li>
		<li class="letter">y</li>
		<li class="letter">u</li>
		<li class="letter">i</li>
		<li class="letter">o</li>
		<li class="letter">p</li>
		<li class="symbol"><span class="off">[</span><span class="on">{</span></li>
		<li class="symbol"><span class="off">]</span><span class="on">}</span></li>
		<li class="symbol lastitem"><span class="off">\</span><span class="on">|</span></li>
		<li class="capslock">caps lock</li>
		<li class="letter">a</li>
		<li class="letter">s</li>
		<li class="letter">d</li>
		<li class="letter">f</li>
		<li class="letter">g</li>
		<li class="letter">h</li>
		<li class="letter">j</li>
		<li class="letter">k</li>
		<li class="letter">l</li>
		<li class="symbol"><span class="off">;</span><span class="on">:</span></li>
		<li class="symbol"><span class="off">'</span><span class="on">&quot;</span></li>
		<li class="return lastitem">return</li>
		<li class="left-shift">shift</li>
		<li class="letter">z</li>
		<li class="letter">x</li>
		<li class="letter">c</li>
		<li class="letter">v</li>
		<li class="letter">b</li>
		<li class="letter">n</li>
		<li class="letter">m</li>
		<li class="symbol"><span class="off">,</span><span class="on">&lt;</span></li>
		<li class="symbol"><span class="off">.</span><span class="on">&gt;</span></li>
		<li class="symbol"><span class="off">/</span><span class="on">?</span></li>
		<li class="right-shift lastitem">shift</li>
		<li class="space lastitem">space</li>
	</ul>
</div>

