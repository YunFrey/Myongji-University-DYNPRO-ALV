*----------------------------------------------------------------------*
***INCLUDE ZT_211_INITIALIZE_TOP.
*----------------------------------------------------------------------*
PROGRAM ZT_211_INITIALIZE_TOP.

TABLES : sflight.

*Dynpro 의 OK_CODE 를 담을 변수 선언
DATA : OK_CODE LIKE SY-UCOMM.

*정보를 담을 인터널테이블 선언
DATA : gt_itab TYPE TABLE OF sflight,
      gs_wa TYPE sflight.

* Docking Contianer
DATA : go_container TYPE REF TO cl_gui_docking_container.
      "custom container 는 스크린 영역 설정 후 설정 가능
      "예) Checkbox + Tabstrip + Radio button ...

* ALV Grid
DATA : go_grid TYPE REF TO cl_gui_alv_grid.


* Field Catalog (테이블 + 구조체)
DATA : gt_fcat TYPE lvc_t_fcat,
      gs_fcat TYPE lvc_s_fcat.

"[lvc_t_fcat] = [lvc_s_fcat] + [lvc_s_fcat]...
"""""""""""""""""""""""""""""
"| 변경할 필드1 | 옵션1   | 옵션 2 |
"| 변경할 필드2 | 옵션1   | 옵션 2 |
"| 변경할 필드 | 옵션1   | 옵션 2 |
"""""""""""""""""""""""""""""

* Layout
DATA : gs_layout TYPE lvc_s_layo.
"| 그리드의 타이틀명 | 칼럼길이 | Zebra |

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
