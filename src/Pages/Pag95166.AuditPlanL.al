

page 95166 "Audit Plan L"
{
    PageType = List;
    SourceTable = "Audit Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit Template ID"; Rec."Audit Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Template ID field.';
                }
                field("Engagement Line No."; Rec."Engagement Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement Line No. field.';
                }
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    OptionCaption = ' ,New Audit,Work In Progress,Audit Follow-up';
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Parent Audit Project ID"; Rec."Parent Audit Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parent Audit Project ID field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Lead Auditor ID"; Rec."Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor ID field.';
                }
                field("Lead Auditor Email"; Rec."Lead Auditor Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor Email field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    OptionCaption = ' ,Board,Company-Level,CEOs Office,Divisions,Section/Units,Huduma Centre';
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Lead Auditee Representative ID"; Rec."Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditee Representative ID field.';
                }
                field("Lead Auditee Email"; Rec."Lead Auditee Email")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Lead Auditee Email field.';
                }
                field("Funding Source ID"; Rec."Funding Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source ID field.';
                }
                field("Budget Control Job No"; Rec."Budget Control Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job No field.';
                }
                field("Budget Control Job Task No."; Rec."Budget Control Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Control Job Task No. field.';
                }

                field("Budget Cost (LCY)"; Rec."Budget Cost (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Budget Cost (LCY) field.';
                }
                field("Internal Audit Charter ID"; Rec."Internal Audit Charter ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Internal Audit Charter ID field.';
                }
                field("Chief Audit Executive ID"; Rec."Chief Audit Executive ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chief Audit Executive ID field.';
                }
                field("Audit Plan Type"; Rec."Audit Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

