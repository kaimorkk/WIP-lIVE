Page 52193840 "Books overdue charge"
{
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Book Issue Details1";
    SourceTableView = where(paid=filter(false),
                            Daysoverdue=filter(>0));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BookNo;"Book No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BookDescription;"Book Description")
                {
                    ApplicationArea = Basic;
                }
                field(ISBN;ISBN)
                {
                    ApplicationArea = Basic;
                    Caption = 'ISBN/ISSN';
                    Editable = false;
                }
                field(IssueDate;"Issue Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DueDate;"Due Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IssuerName;"Issuer Name.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReturnDate;"Return Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Daysoverdue;Daysoverdue)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amountoverdue;"Amount overdue")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Deductby;"deduct by")
                {
                    ApplicationArea = Basic;
                    Caption = 'Deduct by';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Approve? ")
            {
                ApplicationArea = Basic;
                Caption = 'Approve payment?';

                trigger OnAction()
                begin
                    //Charge.GET("Request No");
                    if ("Amount overdue"=0) then begin
                    Message('Do right charges for the right request');
                               exit;
                               end;
                    //IF charge."deduct by"="deduct by'.......' THEN
                    //MESSAGE('Choose the right settlement method');
                      if (paid=false) then  begin
                      if "deduct by" = "deduct by"::Select then begin
                      Message('Select the payment method');
                      exit;
                      end
                        else
                             Daysoverdue:=0;
                             Modify;
                             "Amount overdue":=0;
                             Modify;
                             paid:=true;
                             Modify;
                               Message('You have settle using the using %1',"deduct by");
                    Message(' You have settled your bill');

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Approve? _Promoted"; "Approve? ")
                {
                }
            }
        }
    }

    var
        charge: Record "Book Issue Details1";
}

