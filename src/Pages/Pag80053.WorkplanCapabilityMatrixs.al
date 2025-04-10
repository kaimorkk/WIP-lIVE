

page 80053 "Workplan Capability Matrixs"
{
    PageType = List;
    SourceTable = "PC Capability Matrix";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Capability Category"; Rec."Capability Category")
                {
                    ApplicationArea = Basic;
                }
                field("Capability Description"; Rec."Capability Description")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Summary"; Rec."Inventory Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

