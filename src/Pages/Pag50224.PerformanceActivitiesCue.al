page 50224 "Performance Activities Cue"
{
    Caption = 'Performance Activities Cue';
    PageType = CardPart;
    SourceTable = "HR Activities Cue";

    layout
    {
        area(content)
        {
            cuegroup(Appraisal)
            {

                field("Individual Targets PAS"; Rec."Individual Targets PAS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Individual Targets PAS field.';
                }
                field("Directors PAS"; Rec."Directors PAS")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directors PAS field.';
                }
                field("Open Appraisal"; Rec."Open Appraisal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Open Appraisal field.';
                    DrillDownPageId = "Self-Supervisor Appraisals";
                }

                field("Released Asppraisal"; Rec."Released Appraisal")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Released Appraisal field.';
                    DrillDownPageId = "Self-Supervisor Appraisals-E";

                }
            }

            cuegroup(Approvals)
            {
                Caption = 'Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve-Overdue field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;
}

