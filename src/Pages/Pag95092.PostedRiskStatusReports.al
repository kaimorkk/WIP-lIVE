

page 95092 "Posted Risk Status Reports"
{
    CardPageID = "Risk Status Report";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Risk M&E Header";
    SourceTableView = where("Document Type" = filter("Risk Status Report"),
                            Posted = filter(true));
    UsageCategory = History;
    ApplicationArea = All;

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
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
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
                field("Report Start Date"; Rec."Report Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field("Report End Date"; Rec."Report End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

