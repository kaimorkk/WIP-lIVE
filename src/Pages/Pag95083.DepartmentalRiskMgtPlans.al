

page 95083 "Departmental Risk Mgt. Plans"
{
    CardPageID = "Departmen Risk Management Plan";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Risk Management Plan";
    SourceTableView = where("Document Type" = filter("Functional (Department)"),
                            Status = filter(Open | "Pending Approval"));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division ID';
                    ToolTip = 'Specifies the value of the Division ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Consolidated Risk Mgt Plan No"; Rec."Consolidated Risk Mgt Plan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Consolidated Risk Mgt Plan No field.';
                }
                field("Primary Mission"; Rec."Primary Mission")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Mission field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Risk Likelihood Rate Scale ID"; Rec."Risk Likelihood Rate Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Likelihood Rate Scale ID field.';
                }
                field("Risk Impact Rating Scale ID"; Rec."Risk Impact Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Impact Rating Scale ID field.';
                }
                field("Overall Risk Rating Scale ID"; Rec."Overall Risk Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Overall Risk Rating Scale ID field.';
                }
                field("Risk Appetite Rating Scale ID"; Rec."Risk Appetite Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Appetite Rating Scale ID field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Planning Start Date"; Rec."Planning Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Start Date field.';
                }
                field("Planning End Date"; Rec."Planning End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning End Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date Time"; Rec."Created Date Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date Time field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Functional (Department)";
    end;
}

#pragma implicitwith restore

