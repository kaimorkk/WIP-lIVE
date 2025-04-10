

page 50518 "Store Requisition Notes"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Store Requisition Notes";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Requested"; Rec."Qty. Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Approved"; Rec."Qty. Approved")
                {
                    ApplicationArea = Basic;
                }
                field("Qty. Issued"; Rec."Qty. Issued")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                }
                field("Item No"; Rec."Item No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Unit Measures"; Rec."Unit Measures")
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Qty"; Rec."Remaining Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Requisition Date"; Rec."Requisition Date")
                {
                    ApplicationArea = Basic;
                }
                field("Requsted By"; Rec."Requsted By")
                {
                    ApplicationArea = Basic;
                }
                field(Dept; Rec.Dept)
                {
                    ApplicationArea = Basic;
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("O&rder")
            {
                Caption = 'O&rder';
                Image = "Order";
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                        //Purch.SETRANGE("No.","Line No");
                        //REPORT.RUN(70029,TRUE,TRUE,Purch);
                    end;
                }
            }
        }
    }

    var
        Purch: Record "Purchase Header";
}

#pragma implicitwith restore

