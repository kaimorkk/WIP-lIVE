

page 59139 "Approv.Transport Req Gate Pass"
{
    CardPageID = "Fleet Req Gate Pass Card";
    PageType = List;
    SourceTable = "Transport Req Gate Pass";
    SourceTableView = where(Status = filter(Approved));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Gate Pass Serial No"; Rec."Gate Pass Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gate Pass Serial No field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Requisition No field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
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

