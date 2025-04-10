

page 70070 "Approved Quotations"
{
    CardPageID = Quotation;
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Request";
    SourceTableView = where("Process Type" = const(RFQ),
                            Status = filter(Released),
                            "Quotation Pending Opening" = const(false));


    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Procurement Plan No"; Rec."Procurement Plan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan No field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

