

page 56082 "Tracks"
{
    CardPageID = "Tracks Card";
    InsertAllowed = true;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Tracks;


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Copyright No"; Rec."Copyright No")
                {
                    ApplicationArea = Basic;
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Title"; Rec."Track Title")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work Category"; Rec."Track Work Category")
                {
                    ApplicationArea = Basic;
                }
                field("Track Work SubCategory"; Rec."Track Work SubCategory")
                {
                    ApplicationArea = Basic;
                }
                field("Track Category Description"; Rec."Track Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Track SubCategory Desc"; Rec."Track SubCategory Desc")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                }
                field("Track Language"; Rec."Track Language")
                {
                    ApplicationArea = Basic;
                }
                field("<Track Work Abstract>"; ObjText)
                {
                    ApplicationArea = Basic;
                    Caption = 'Track Work Abstract';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Track Work Abstract");
        Rec."Track Work Abstract".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
}

#pragma implicitwith restore

