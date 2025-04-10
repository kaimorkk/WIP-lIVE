page 50185 "Suggestions list"
{
    ApplicationArea = All;
    Caption = 'Suggestions list';
    PageType = List;
    SourceTable = "Cases Management";
    CardPageId = "Suggestions Card";
    
   layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Enquiry Number"; Rec."Enquiry Number")
                {
                    ToolTip = 'Specifies the value of the Complaints Nos field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Assigned Officer Name"; Rec."Assigned Officer Name")
                {
                    Caption= 'Complimented Employee';
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
            }
        }
    }
}
