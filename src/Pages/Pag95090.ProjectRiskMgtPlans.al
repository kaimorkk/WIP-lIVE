

page 95090 "Project Risk Mgt. Plans"
{
    CardPageID = "Project Risk Management Plan";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Risk Management Plan";
    SourceTableView = where("Document Type" = filter(Project),
                            Status = filter(Open | "Pending Approval"));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Work Execution Plan ID"; Rec."Work Execution Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date Time"; Rec."Created Date Time")
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
        Rec."Document Type" := Rec."document type"::Project;
    end;
}

#pragma implicitwith restore

