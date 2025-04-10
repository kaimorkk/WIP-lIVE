page 50356 "Budget Comments"
{
    Caption = ' Review Comments';
    PageType = List;
    SourceTable = "Budget Comment";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Editable = CanEdit;
                field(Comment; CommentTxt)
                {
                    ApplicationArea = Basic, Suite;
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Comment);
                        Rec.Comment.CreateInStream(Instr);
                        BigTxt.Read(Instr);

                        if CommentTxt <> Format(BigTxt) then begin
                            Clear(Rec.Comment);
                            Clear(BigTxt);
                            BigTxt.AddText(CommentTxt);
                            Rec.Comment.CreateOutStream(OutStr);
                            BigTxt.Write(OutStr);
                        end;
                        CurrPage.Update();
                    end;
                }
                field("User ID"; "User ID")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    var
        CanEdit, GlobalCanEdit : Boolean;
        Instr: Instream;
        BigTxt: BigText;
        CommentTxt: Text;
        OutStr: Outstream;

    trigger OnAfterGetRecord()
    begin
        CommentTxt := '';
        CanEdit := GlobalCanEdit and (Rec."User ID" = UserId);
        Rec.CalcFields(Comment);
        Rec.Comment.CreateInStream(Instr);
        BigTxt.Read(Instr);
        CommentTxt := format(BigTxt)
    end;

    trigger OnOpenPage()
    begin
        CanEdit := true;
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if (not CanEdit) then
            Error('You cannot delete this comment')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."User ID" := UserId;
        CommentTxt := '';
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."User ID" := UserId;
        CommentTxt := '';
    end;

    procedure setCanEdit(CanEditPassed: Boolean)
    begin
        GlobalCanEdit := CanEditPassed;
    end;






}
