

page 59123 "Fleet Fuel Requisition"
{
    PageType = ListPart;
    SourceTable = "Fuel Travel Requisition";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Type field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job Task"; Rec."Job Task")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

