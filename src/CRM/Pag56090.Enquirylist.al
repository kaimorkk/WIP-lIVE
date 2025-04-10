

page 56090 "Enquiry list"
{
    CardPageID = "Enquiry Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Cases Management";
   


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Enquiry Number"; Rec."Enquiry Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complaints Nos';
                    ToolTip = 'Specifies the value of the Complaints Nos field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving Officer field.';
                }
                field("Resource Assigned"; Rec."Resource Assigned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Assigned field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Case Solved"; Rec."Case Solved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resolved field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed By field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

