page 50452 "Budget Control Header"
{
    Caption = 'Budget Control Header';
    PageType = List;
    CardPageId="Budget Control Card";
    SourceTable = "Budget Control Header";
    Editable=false;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Year field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter field.', Comment = '%';
                }
            }
        }
    }
}
