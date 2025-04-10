

page 95220 "Audit Commencement Notices"
{
    CardPageID = "Audit Commencement Notice";
    PageType = List;
    SourceTable = "Audit Mobilization Header1";
    SourceTableView = where("Document Type" = filter("Audit Commencement Notice"));
    UsageCategory = Tasks;
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
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Audit Commencement Notice No."; Rec."Audit Commencement Notice No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Commencement Notice No. field.';
                }
                field("Auditee Notice Response No."; Rec."Auditee Notice Response No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Auditee Notice Response No. field.';
                }
                field("Entrace Meeting No."; Rec."Entrace Meeting No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entrace Meeting No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Audit Lead ID"; Rec."Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Lead ID field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Auditee Lead ID"; Rec."Auditee Lead ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Auditee Lead ID field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("Entrance Meeting Venue"; Rec."Entrance Meeting Venue")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entrance Meeting Venue field.';
                }
                field("Entrance Meeting Start Date"; Rec."Entrance Meeting Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entrance Meeting Start Date field.';
                }
                field("Entrance Meeting Start Time"; Rec."Entrance Meeting Start Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entrance Meeting Start Time field.';
                }
                field("Entrance Meeting End Date"; Rec."Entrance Meeting End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entrance Meeting End Date field.';
                }
                field("Entrance Meeting End Time"; Rec."Entrance Meeting End Time")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Entrance Meeting End Time field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Meeting Medium"; Rec."Meeting Medium")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Meeting Medium field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

