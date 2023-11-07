*----------------------------------------------------------------------*
***INCLUDE ZT_211_DYNPRO_USER_COMMAND_I01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE USER_COMMAND_0100 INPUT.

CASE OK_CODE.
  WHEN 'EXIT'.
    LEAVE PROGRAM.
  WHEN 'BACK'.
    LEAVE TO SCREEN 0.
  WHEN 'SELECT'.
    SELECT * FROM sflight INTO TABLE gt_itab WHERE carrid = sflight-carrid.
ENDCASE.

CLEAR OK_CODE.

ENDMODULE.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
