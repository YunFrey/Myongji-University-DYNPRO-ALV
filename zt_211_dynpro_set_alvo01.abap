*----------------------------------------------------------------------*
***INCLUDE ZT_211_DYNPRO_SET_ALVO01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module SET_ALV OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE SET_ALV OUTPUT.
" 컨테이너가 초기값이면 밑에 구문 실행, 아니면 그냥 종료
CHECK go_container IS INITIAL.


  "컨테이너 생성 (Ctrl+Space 로 자동완성)
  "컨테이너와 REPORT + DYNPRO 연결하기
  CREATE OBJECT GO_CONTAINER
    EXPORTING
      DYNNR                       = SY-DYNNR
      extension = 800.

  "그리드 생성
  "그리드의 부모는 컨테이너
  CREATE OBJECT GO_GRID
    EXPORTING
      I_PARENT = go_container.

* [FIELD CATALOG 사용]
  "
  CLEAR gs_fcat.
  gs_fcat-fieldname = 'CARRID'. "변경할 필드명
  gs_fcat-coltext = 'CARRID ID'. "바꿀 필드명 지정
  gs_fcat-just = 'C'. " 중앙정렬
  APPEND gs_fcat TO gt_fcat. "필드 카탈로그 구조체 값 추가

  CLEAR gs_fcat.
  gs_fcat-fieldname = 'CONNID'. "변경할 필드명
  gs_fcat-coltext = 'FLIGHT NUM'. "바꿀 필드명 지정
  gs_fcat-just = 'C'. " 중앙정렬
  APPEND gs_fcat TO gt_fcat. "필드 카탈로그 구조체 값 추가

  "전체를 변경하고 싶다!
*  SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE gt_fcat.
*
*  LOOP AT gt_fcat INTO gs_fcat.
*     gs_fcat-fieldname = 'CONNID'. "변경할 필드명
*     gs_fcat-coltext = 'FLIGHT NUM'. "바꿀 필드명 지정
*     gs_fcat-just = 'C'. " 중앙정렬
*     APPEND gs_fcat TO gt_fcat.
*  ENDLOOP.

* [Layout 설정]
  gs_layout-grid_title = 'ALV'.
  gs_layout-cwidth_opt = 'X'. "칼럼길이 자동조절 활성화
  gs_layout-zebra = 'X'. "줄무늬 패턴 지정


  "그리드 호출
  "그리드는 SFLIGHT 에서 따온 gt_itab 의 영향을 받는다.
  CALL METHOD go_grid->set_table_for_first_display
    EXPORTING
      i_structure_name = 'SFLIGHT' "인터널 출력 테이블 구조체명
      is_layout = gs_layout
    CHANGING
      it_outtab = gt_itab "출력 테이블
      it_fieldcatalog = gt_fcat. "필드카탈로그

ENDMODULE.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
