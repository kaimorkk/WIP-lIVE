
/// <summary>
/// Page Audit Followup Headers (ID 95212).
/// </summary>

page 95212 "Audit Followup Headers"
{
    CardPageID = "Audit Followup Header";
    PageType = List;
    SourceTable = "Audit Followup Header";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
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
                field("Primary RC ID"; Rec."Primary RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary RC ID field.';
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
                field(Control23; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Control24; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Control25; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Control26; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                // field("Entrance Meeting Venue"; "Entrance Meeting Venue")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Entrance Meeting Venue field.';
                // }
                // field("Entrance Meeting Start Date"; "Entrance Meeting Start Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Entrance Meeting Start Date field.';
                // }
                // field("Entrance Meeting Start Time"; "Entrance Meeting Start Time")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Entrance Meeting Start Time field.';
                // }
                // field("Entrance Meeting End Date"; "Entrance Meeting End Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Entrance Meeting End Date field.';
                // }
                // field("Entrance Meeting End Time"; "Entrance Meeting End Time")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Entrance Meeting End Time field.';
                // }
                // field(Duration; Duration)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Duration field.';
                // }
                // field("Meeting Medium"; "Meeting Medium")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Meeting Medium field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

