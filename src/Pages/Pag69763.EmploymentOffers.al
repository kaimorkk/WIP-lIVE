

page 69763 "Employment Offers"
{
    CardPageID = "Employment Offer";
    Editable = false;
    PageType = List;
    SourceTable = "Employment Offer";
    UsageCategory = Tasks;
    SourceTableView = where("Document Type" = const("Offer letter"));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Offer ID"; Rec."Offer ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Panel Interview Report ID"; Rec."Panel Interview Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Interview Report ID field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Employment Start Date"; Rec."Employment Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Start Date field.';
                }
                field("Payroll Start Period"; Rec."Payroll Start Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Start Period field.';
                }
                field("Offer Expiration Date"; Rec."Offer Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer Expiration Date field.';
                }
                field("Offer Acceptance Status"; Rec."Offer Acceptance Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Offer Acceptance Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control64; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control65; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control66; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control67; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

