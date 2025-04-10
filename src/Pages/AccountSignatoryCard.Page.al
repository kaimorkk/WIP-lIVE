Page 52193566 "Account Signatory Card"
{
    PageType = Card;
    SourceTable = "Account Signatories";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(Names;Names)
                {
                    ApplicationArea = Basic;
                }
                field(IDNo;"ID No.")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfBirth;"Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(StaffPayrollNo;"Telephone No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff/Payroll No.';
                }
                field(Signatory;Signatory)
                {
                    ApplicationArea = Basic;
                }
                field(MustSign;"Must Sign")
                {
                    ApplicationArea = Basic;
                }
                field(MustbePresent;"Must be Present")
                {
                    ApplicationArea = Basic;
                }
                field(Picture;Picture)
                {
                    ApplicationArea = Basic;
                }
                field(Control1102760019;Signature)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Photograh)
            {
                Caption = 'Photograh';
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';

                    trigger OnAction()
                    begin
                        /*PictureExists := Picture.HASVALUE;
                        IF Picture.IMPORT('*.bmp',TRUE) = '' THEN
                        EXIT;
                        IF PictureExists THEN
                        IF NOT CONFIRM('Do you want to replace the existing picture of %1 %2?',FALSE,TABLENAME,Names) THEN
                        EXIT;
                        CurrPage.SAVERECORD;*/

                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'Export';

                    trigger OnAction()
                    begin
                        /*IF Picture.HASVALUE THEN
                        Picture.EXPORT('*.bmp',TRUE); */

                    end;
                }
                action(Delete)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delete';

                    trigger OnAction()
                    begin
                        /*IF Picture.HASVALUE THEN
                        IF CONFIRM('Do you want to delete the picture of %1 %2?',FALSE,TABLENAME,Names) THEN BEGIN
                        CLEAR(Picture);
                        CurrPage.SAVERECORD;
                        END;  */

                    end;
                }
            }
            group(Signature)
            {
                Caption = 'Signature';
                action(Action1102760022)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';

                    trigger OnAction()
                    begin
                        /*PictureExists := Signature.HASVALUE;
                        IF Signature.IMPORT('*.bmp',TRUE) = '' THEN
                        EXIT;
                        IF PictureExists THEN
                        IF NOT CONFIRM('Do you want to replace the existing picture of %1 %2?',FALSE,TABLENAME,Names) THEN
                        EXIT;
                        CurrPage.SAVERECORD;*/

                    end;
                }
                action(Action1102760023)
                {
                    ApplicationArea = Basic;
                    Caption = 'Export';

                    trigger OnAction()
                    begin
                        /*IF Signature.HASVALUE THEN
                        Signature.EXPORT('*.bmp',TRUE);    */

                    end;
                }
                action(Action1102760024)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delete';

                    trigger OnAction()
                    begin
                        if Signature.Hasvalue then
                        if Confirm('Do you want to delete the picture of %1 %2?',false,TableName,Names) then begin
                        Clear(Signature);
                        CurrPage.SaveRecord;
                        end;
                    end;
                }
            }
        }
    }

    var
        PictureExists: Boolean;
}

