

page 75029 "Procurement Category Product"
{
    PageType = List;
    SourceTable = "Procurement Category Product";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
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

