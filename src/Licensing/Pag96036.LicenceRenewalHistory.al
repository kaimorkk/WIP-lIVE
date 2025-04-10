page 96036 "Licence Renewal History"
{
    ApplicationArea = All;
    Caption = 'Licence Renewal History';
    PageType = ListPart;
    SourceTable = "Licence Renewal Lines";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Licence ID"; Rec."Licence ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Licence ID field.', Comment = '%';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.', Comment = '%';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.', Comment = '%';
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
