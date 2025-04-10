

page 70053 "Contract Manangement Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Management Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("Service Provided"; Rec."Service Provided")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Provided field.';
                }
                field("Contract Amount"; Rec."Contract Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

