

page 59120 "Non Staff Tavel Request"
{
    PageType = ListPart;
    SourceTable = "Travel Requisition Non Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Daily Work Ticket"; Rec."Daily Work Ticket")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Work Ticket field.';
                }
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

