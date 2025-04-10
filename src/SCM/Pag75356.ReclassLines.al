

page 75356 "Reclass Lines"
{
    PageType = ListPart;
    SourceTable = "FA Reclass Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Reclass. Acq Amount"; Rec."Reclass. Acq Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        FAReclassificationHeader.Reset;
        FAReclassificationHeader.SetRange("No.", Rec."Header No.");
        if FAReclassificationHeader.Find('-') then begin
            Rec."FA SubClass" := FAReclassificationHeader."FA SubClass";
            Rec.Modify;
        end;
    end;

    var
        FAReclassificationHeader: Record "FA Reclassification Header";
}

#pragma implicitwith restore

