page 96037 "Licence Restoration History"
{
    ApplicationArea = All;
    Caption = 'Licence Restoration History';
    PageType = ListPart;
    SourceTable = "Licence Restoration Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("License No."; Rec."License No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the License No. field.', Comment = '%';
                }
                field("Registration ID"; Rec."Registration ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration No.';
                    ToolTip = 'Specifies the value of the Registration ID field.', Comment = '%';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.', Comment = '%';
                }
                field("Grounds for Removal"; Rec."Grounds for Removal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grounds for Removal field.', Comment = '%';
                }
                field("Licence Start Date"; Rec."Licence Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Start Date field.', Comment = '%';
                }
                field("Licence Expiry Date"; Rec."Licence Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence Expiry Date field.', Comment = '%';
                }
            }
        }
    }
}
