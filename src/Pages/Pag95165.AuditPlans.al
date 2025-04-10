

page 95165 "Audit Plans"
{
    CardPageID = "Audit Plan";
    PageType = List;
    SourceTable = "Audit Plan";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
                field("Audit Plan Type"; Rec."Audit Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Type field.';
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
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Code field.';
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Overall Purpose"; Rec."Overall Purpose")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Purpose field.';
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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("No. Of Budgeted New Audit Proj"; Rec."No. Of Budgeted New Audit Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Budgeted New Audit Proj field.';
                }
                field("No. Of Budgeted WIP Audit Proj"; Rec."No. Of Budgeted WIP Audit Proj")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Budgeted WIP Audit Proj field.';
                }
                field("No. Of Budgeted Audit Follow-u"; Rec."No. Of Budgeted Audit Follow-u")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Budgeted Audit Follow-u field.';
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
                field("Created Datetime"; Rec."Created Datetime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Datetime field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

