page 70057 "Inspection Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(TechnicalSpecification; "Technical Specification")
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasure; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(QuantityOrdered; "Quantity Ordered")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(InspectionDecision; "Inspection Decision")
                {
                    ApplicationArea = Basic;
                }
                field(AcceptedQuantity; "Quantity Received")
                {
                    ApplicationArea = Basic;
                    Caption = 'Accepted Quantity';
                }
                field(Variance; "Rejected Quantity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Variance';
                }
                field(ReasonsforVariance; "Reasons for Rejection")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reasons for Variance';
                }
                field(Remarks; Remarks)
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

