Page 52194112 "Appraisal Formats"
{
    AutoSplitKey = true;
    PageType = Card;
    SourceTable = "Appraisal Formats1";
    SourceTableView = sorting("Appraisal Code", Sequence)
                      order(ascending);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AppraisalHeadingType; "Appraisal Heading Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Sequence; Sequence)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Value; Value)
                {
                    ApplicationArea = Basic;
                }
                field(Bold; Bold)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(InPut; "In Put")
                {
                    ApplicationArea = Basic;
                }
                field(EntryBy; "Entry By")
                {
                    ApplicationArea = Basic;
                }
                field(AfterEntryOfPrevGroup; "After Entry Of Prev. Group")
                {
                    ApplicationArea = Basic;
                }
                field(AllowPreviousGroupsRights; "Allow Previous Groups Rights")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        ValueOnFormat;
    end;

    var

        ValueEmphasize: Boolean;

    local procedure ValueOnFormat()
    begin

        if Bold then
            ValueEmphasize := true;
    end;
}

