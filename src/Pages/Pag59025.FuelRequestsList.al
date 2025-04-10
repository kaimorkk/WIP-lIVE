

page 59025 "Fuel Requests List"
{
    CardPageID = "Fuel Requisition Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Type = filter(Fuel),
                            Status = const(Open));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Date';
                    ToolTip = 'Specifies the value of the Approved Date field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project To Transfer From';
                    ToolTip = 'Specifies the value of the Project To Transfer From field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Name';
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount to Transfer';
                    ToolTip = 'Specifies the value of the Amount to Transfer field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

