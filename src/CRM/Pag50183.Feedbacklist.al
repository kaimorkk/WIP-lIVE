page 50183 "Feedback list"
{
    ApplicationArea = All;
    Caption = 'Feedback list';
    PageType = List;
    SourceTable = "Cases Management";
    SourceTableView = where("Interaction Type" = filter(Feedback));
    CardPageId = "Feedback Card";
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
                field("Received From"; Rec."Received From")
                {
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field("Assigned Officer Name"; Rec."Assigned Officer Name")
                {
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
            }
        }
    }
}
