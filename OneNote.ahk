#SingleInstance force ;������ �Ƿ����¼��ص���Ϣ

global en := DllCall("LoadKeyboardLayout", "Str", "00000409", "Int", 1)
global zn := DllCall("LoadKeyboardLayout", "Str", "00000804", "Int", 1)
global font:="con"
global chfont:="������κ"

;consolas->consolas;fira->fira code;cambria->cambria math 
;��Ҫ�����������ڿ��ٷ��ʹ�����,λ��8

;;;;;;;;ONENOTE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive, ahk_class Framework::CFrame

F1:: 
  Send !f
  Send T
  Send !f
  ;;����consolas
  Send c
  Loop 15{
    Send {Down}
  }
  Send {Enter}{Enter}

^F1::
  Send !f
  Send T
  Send !f
  ;;���û�����κ
  Send y
  Loop 23{
    Send {Down}
  }
  Send {Enter}{Enter}
  return

;;����������
  !^1::
    Send ^!1{Esc} ;if not select, esc not use ; else cancel select
    Send ^a 
    SetFon()
    return
  !^2::
    Send ^!2{Esc}
    Send ^a
    SetFon()
    return
  !^3::
    Send ^!3{Esc}
    Send ^a
    SetFon()
    return
  !^4::
    Send ^!4{Esc}
    Send ^a
    SetFon()
    return
  !^5::
    Send ^!5{Esc}
    Send ^a
    SetFon()
    return
  !^6::
    Send ^!6{Esc}
    Send ^a
    SetFon()
    return

  !^0::
    send !^0{Esc}
    Send ^a
    SetFon()
    return

;;;cambria math����Ŀ���
F3::
    if(font="con"){
      font:="cam"
      SetEnglish()
      Send !8
      Send cambria math{Enter}{Esc}
    } else {
      font:="con"
    }
    return

SetFon(){
    lang :=DllCall("GetKeyboardLayout", Int,DllCall("GetWindowThreadProcessId", int,WinActive("A"), Int,0))
    
    Send !8

    if (lang = zn){
      SetEnglish()

      SetFon() 
      
      SetChinese()
      ;���������Ϊ���� ѡ����һ����� ʱҲ�ܸ�������
    } else {

      Send %font%{Enter}{esc}{esc}
    }
    
}

shift:: ;�˴���Ӧ���Զ����OneNote��ר�õ��л����뷨��ݼ�
  send {Ctrl Down}{Shift down}{ctrl up}{shift up} ;�˴���Ӧϵͳ�л���Ӣ���뷨�Ŀ�ݼ�
  ;��ȡ��ǰ���뷨
  lang :=DllCall("GetKeyboardLayout", Int,DllCall("GetWindowThreadProcessId", int,WinActive("A"), Int,0))
  
  if (lang = en){
      Send !8  ;�˴���Ӧ ѡ�������� �Ŀ�ݼ�,�Ұ������� �����˿��ٷ��ʹ�����
      Send con ;consolas
      Send {enter}{esc}{esc}
  }
  return

;;;�ڱ��������һ��
;;;overdriven and ignore TIM_QQ shortcut 
^!e::
  send !JLL
return
;;;������
  F2::Send {RButton}R
return
;;;������
  ^d::Send ^a^c{Right}^v
  return
;;;ɾ����
^!BS::Send ^a{BS}
return
;;;;ѡ��һ��
^LButton::Send {LButton Down}{LButton Up}^a
return
#ifWinactive

;�༭������ĳ��ahk�ű�

; #^e::
;  Run,notepad "???alt+q.ahk"
; return
; #^r::
;   Send ^s ;����
;   Run,open "???\alt+q.ahk"
; return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;������;;;;;;;;;;;;
SetEnglish(){
  PostMessage, 0x50, 0, %en%,, A
}
SetChinese(){
  PostMessage, 0x50, 0, %zn%,, A
}

;;;�½���������,������Ϊfira code ����

; ^!#w::
; ^!w::
; Send !6{1}{Tab}{1}{Enter}

; a:=font
; msgbox %a%
; ;;;;TODO var knows
; font:="fir"
; SetFon()
; font:=a 

; if (GetKeyState("LWin","P"))
;   send {{}{}}{Left}{Enter}{Enter}{Left}{Tab}{Left}{Left}

; return