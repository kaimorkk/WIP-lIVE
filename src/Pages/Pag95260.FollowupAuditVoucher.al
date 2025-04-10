
/// <summary>
/// Page Follow-up Audit Voucher (ID 95260).
/// </summary>

page 95260 "Follow-up Audit Voucher"
{
    PageType = Card;
    SourceTable = "Audit Followup Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Reporting As At"; Rec."Reporting As At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting As At field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                // field("Audit Lead ID"; "Audit Lead ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Audit Lead ID field.';
                // }
                // field("Auditee Type"; "Auditee Type")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Auditee Type field.';
                // }
                // field("Project ID"; "Project ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Project ID field.';
                // }
                // field("Primary Auditee ID"; "Primary Auditee ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                // }
                // field("Auditee Name"; "Auditee Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Auditee Name field.';
                // }
                // field("Auditee Lead ID"; "Auditee Lead ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Auditee Lead ID field.';
                // }
                // field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                // }
                // field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                // }
                // field("Dimension Set ID"; "Dimension Set ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Dimension Set ID field.';
                // }
                field(Control24; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Control25; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Control26; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Control27; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
            }
            // part(Checklist; "Audit Project Checklist Lines")
            // {
            //     SubPageLink = "Engagement ID" = field("Reporting As At");
            //     ApplicationArea = Basic;
            // }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Followup Audit Voucher";
    end;
}

#pragma implicitwith restore

