
Page 52193925 "User Signature"
{
    Caption = 'User Picture';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = "User Setup";

    layout
    {
        area(content)
        {
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
            }
            field(Control1; Rec.Picture)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Picture)
            {
                Caption = '&Picture';
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;
                    Visible = false;
                    trigger OnAction()
                    begin
                        PictureExists := Rec.Picture.Hasvalue;
                        // if Rec.Picture.Import('*.BMP') = '' then
                        //     exit;
                        if PictureExists then
                            if not Confirm(Text001, false, Rec.TableCaption, Rec."User ID") then
                                exit;
                        CurrPage.SaveRecord;
                    end;
                }
                action(Delete)
                {
                    ApplicationArea = Basic;
                    Caption = 'Delete';

                    trigger OnAction()
                    begin
                        if Rec.Picture.Hasvalue then
                            if Confirm(Text002, false, Rec.TableCaption, Rec."User ID") then begin
                                Clear(Rec.Picture);
                                CurrPage.SaveRecord;
                            end;
                    end;
                }
            }
        }
    }

    var
        Text001: label 'Do you want to replace the existing picture of %1 %2?';
        Text002: label 'Do you want to delete the picture of %1 %2?';
        PictureExists: Boolean;
}

#pragma implicitwith restore

