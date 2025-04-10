

page 70006 "Procurement Plan Items"
{
    PageType = ListPart;
    SourceTable = "Procurement Plan1";
    SourceTableView = sorting("Plan Item No")
                      order(ascending);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Plan Item No"; Rec."Plan Item No")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Advertisement Date"; Rec."Advertisement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Bid/Quotation Opening Date"; Rec."Bid/Quotation Opening Date")
                {
                    ApplicationArea = Basic;
                }
                field("Proposal Evaluation date"; Rec."Proposal Evaluation date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract End Date (Planned)"; Rec."Contract End Date (Planned)")
                {
                    ApplicationArea = Basic;
                }
                field("TOR/Technical specs due Date"; Rec."TOR/Technical specs due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Opening date"; Rec."Financial Opening date")
                {
                    ApplicationArea = Basic;
                }
                field("Negotiation date"; Rec."Negotiation date")
                {
                    ApplicationArea = Basic;
                }
                field("Notification of award date"; Rec."Notification of award date")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ApplicationArea = Basic;
                }
                field("Target Groups"; Rec."Target Groups")
                {
                    ApplicationArea = Basic;
                }
                field(Youth; Rec.Youth)
                {
                    ApplicationArea = Basic;
                }
                field(Women; Rec.Women)
                {
                    ApplicationArea = Basic;
                }
                field(PWD; Rec.PWD)
                {
                    ApplicationArea = Basic;
                }
                field("Citizen Contractors"; Rec."Citizen Contractors")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Code"; Rec."Funding Source Code")
                {
                    ApplicationArea = Basic;
                }
                field("Source of Funds"; Rec."Source of Funds")
                {
                    ApplicationArea = Basic;
                    Caption = 'G/L Account';
                }
                field("Margin of preference for Local"; Rec."Margin of preference for Local")
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Items"; Rec."Requisition Items")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Budget"; Rec."Approved Budget")
                {
                    ApplicationArea = Basic;
                }
                field(Actual; Rec.Actual)
                {
                    ApplicationArea = Basic;
                }
                field(Commitment; Rec.Commitment)
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Amount"; Rec."Quarter 1 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Amount"; Rec."Quarter 2 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Amount"; Rec."Quarter 3 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Amount"; Rec."Quarter 4 Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 1 Qty"; Rec."Quarter 1 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 2 Qty"; Rec."Quarter 2 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 3 Qty"; Rec."Quarter 3 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter 4 Qty"; Rec."Quarter 4 Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task No."; Rec."Job Task No.")
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

