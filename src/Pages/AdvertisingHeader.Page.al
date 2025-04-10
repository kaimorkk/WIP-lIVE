Page 52193868 "Advertising Header"
{
    PageType = Card;
    SourceTable = "Recruitment Needs1";
    SourceTableView = where(Status=const(Released));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Positions;Positions)
                {
                    ApplicationArea = Basic;
                }
                field(StartDate;"Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedReportingDate;"Expected Reporting Date")
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000010)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19015751;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;Advertising)
            {
                SubPageLink = "Need Code"=field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;

                trigger OnAction()
                begin

                    LineNo := 1;
                    Advertising.Reset;
                    //Advertising.SETRANGE(Advertising."Code","No.");
                    Advertising.SetRange(Advertising.Posted,false);
                    if Advertising.Find('-') then begin
                    repeat
                    PurchaseHeader."Document Type":=PurchaseHeader."document type"::Invoice;
                    PurchaseHeader."No.":='8';
                    PurchaseHeader."Buy-from Vendor No.":=Advertising."Advertising Media";
                    PurchaseHeader.Validate("Buy-from Vendor No.");
                    PurchaseHeader.Insert;

                    PurchaseLine."Document Type":=PurchaseLine."document type"::Invoice;
                    PurchaseLine."Line No.":=LineNo;
                    PurchaseLine."Document No.":='8';
                    PurchaseLine.Type:=PurchaseLine.Type::Item;
                    PurchaseLine."No.":='70061';
                    PurchaseLine.Validate("No.");
                    PurchaseLine.Quantity:=1;
                    PurchaseLine."Unit Cost":=Advertising.Amount;
                    PurchaseLine.Validate("Unit Cost");
                    PurchaseLine.Insert;
                     LineNo := LineNo + 1;
                    Advertising.Posted:=true;
                    Advertising.Modify;
                     until Advertising.Next=0;
                    end;

                    Message('%1','Posting Competed successfully.');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
        }
    }

    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        Advertising: Record Advertising1;
        LineNo: Integer;
        Text19015751: label 'Advertising';
}

