
page 69372 "Exit Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Exit Plan Lines";
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(LineNo; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(PrimaryDirectorate; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field(PrimaryDirectorateName; Rec."Primary Directorate Name")
                {
                    ApplicationArea = Basic;
                }
                field(ResponsibleEmployee; Rec."Responsible Employee")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee Name"; Rec."Responsible Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Responsible Employee Name field.';
                }
                field(PlannedDate; Rec."Planned Date")
                {
                    ApplicationArea = Basic;
                }
                field(ActualDate; Rec."Actual Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(clearedBy; Rec."cleared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

