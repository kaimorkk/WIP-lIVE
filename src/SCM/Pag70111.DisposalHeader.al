

page 70111 "Disposal Header"
{
    PageType = Card;
    SourceTable = "Disposal Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Editable = Editablex;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = Editablex;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Closing Date"; Rec."Closing Date")
                {
                    ApplicationArea = Basic;
                    Editable = Editablex;
                    ToolTip = 'Specifies the value of the Closing Date field.';
                }
                field("Disposal Plan"; Rec."Disposal Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal Plan field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Reason For Disposal"; Rec."Reason For Disposal")
                {
                    ApplicationArea = Basic;
                    Editable = Editablex;
                    ToolTip = 'Specifies the value of the Reason For Disposal field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = Editablex;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = Editablex;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Select Customer"; Rec."Select Customer")
                {
                    ApplicationArea = Basic;
                    Visible = biddersvisible;
                    ToolTip = 'Specifies the value of the Select Customer field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = biddersvisible;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
            }
            part(Control11; "Disposal Sub Page")
            {
                Editable = Editablex;
                SubPageLink = "Document No." = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup13)
            {
                action(Bidders)
                {
                    ApplicationArea = Basic;
                    Enabled = biddersvisible;
                    Image = Vendor;
                    RunObject = Page "Disposal Bidders";
                    RunPageLink = "Disposal No." = field(No);
                    ToolTip = 'Executes the Bidders action.';
                    trigger OnAction()
                    begin
                        /*
                        DisposalBidders.RESET;
                        DisposalBidders.SETRANGE("Disposal No.",No);
                        IF DisposalBidders.FINDFIRST THEN
                        
                        DisposalLines.RESET;
                        DisposalLines.SETRANGE("Document No.",No);
                        IF DisposalLines.FINDSET THEN
                          BEGIN
                            REPEAT
                              DisposalBidsPerLine1.INIT;
                              DisposalBidsPerLine1."Document No.":=DisposalLines."Document No.";
                              DisposalBidsPerLine1."Disposal No":=DisposalLines."Document No.";
                              DisposalBidsPerLine1.Type:=DisposalBidsPerLine1.Type::"Fixed Asset";
                              DisposalBidsPerLine1.No:=DisposalLines."Fixed Asset No.";
                              DisposalBidsPerLine1.Description:=DisposalLines."FA Name";
                              DisposalBidsPerLine1.Quantity:=1;
                              DisposalBidsPerLine1.Customer:=DisposalBidders.Name;
                              DisposalBidsPerLine1.INSERT;
                              UNTIL DisposalLines.NEXT=0;
                        
                            END;
                            */

                    end;
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    begin
                        ////if //ApprovalsMgmt.CheckDisposalRequestApprovalPossible(Rec) THEN
                        Rec.TestField(Status, Rec.Status::Open);
                        //  //ApprovalsMgmt.OnSendDisposalRequestDocForApproval(Rec);
                    end;
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Image = CancelApprovalRequest;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        ////if //ApprovalsMgmt.CheckDisposalRequestApprovalPossible(Rec) THEN
                        ////ApprovalsMgmt.OnCancelDisposalRequestApprovalRequest(Rec);
                    end;
                }

                action("Iniate Disposal Method")
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    ToolTip = 'Iniate Disposal Method';
                    trigger OnAction()
                    var
                        Procurement: codeunit "Procurement Processing";
                    begin
                        Rec.TESTFIELD(Status, Rec.Status::Approved);
                        Procurement.FnInitiateDisposalMethod(Rec);
                        MESSAGE('Disposal been Initated Successfully');
                        CurrPage.CLOSE;
                    end;
                }

                action("Create Sales Order")
                {
                    ApplicationArea = Basic;
                    Image = SalesInvoice;
                    ToolTip = 'Executes the Create Sales Order action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Select Customer");
                        Rec.TestField("Sales Order Created", false);
                        DisposalBidders.Reset;
                        DisposalBidders.SetRange("Disposal No.", Rec.No);
                        if DisposalBidders.Find('-') then begin
                            repeat
                                DisposalBidders.TestField(Name);
                                DisposalBidders.TestField("Email Address");
                                DisposalBidders.TestField(Amount);
                                DisposalBidders.TestField("Phone No.");
                                DisposalBidders.TestField("Contact Person");
                                DisposalBidders.TestField("Physical Addess");
                            until DisposalBidders.Next = 0;
                        end;
                        DisposalBidders.Reset;
                        DisposalBidders.SetRange("Disposal No.", Rec.No);
                        DisposalBidders.SetRange(Award, true);
                        if not DisposalBidders.FindFirst then begin
                            Error('You must award the disposal to atleast one bidder');
                        end;

                        SalesSetup.Get;
                        SalesSetup.TestField("Posted Shipment Nos.");
                        SalesSetup.TestField("Posted Invoice Nos.");
                        Rec.Reset;
                        if Rec.Get(Rec.No) then begin
                            SalesHeader.Reset;
                            SalesHeader.Init;
                            SalesHeader."Document Type" := SalesHeader."document type"::Order;
                            SalesHeader.Validate("Document Type");
                            SalesHeader."No." := NoMgt.GetNextNo(SalesSetup."Order Nos.", Today, true);
                            SalesHeader."Document Type" := SalesHeader."document type"::Order;
                            SalesHeader."Sell-to Customer No." := Rec."Select Customer";
                            SalesHeader.Validate("Sell-to Customer No.");
                            SalesHeader."Assigned User ID" := UserId;
                            //SalesHeader.//"Customer Category":=SalesHeader."Customer Category"::Organization;
                            SalesHeader."Posting No. Series" := SalesSetup."Posted Invoice Nos.";

                            SalesHeader."Shipping No. Series" := SalesSetup."Posted Shipment Nos.";
                            if UserSetup.Get(UserId) then begin
                                SalesHeader."Shortcut Dimension 1 Code" := UserSetup."Global Dimension 1 Code";
                                SalesHeader."Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 2 Code";

                            end;
                            SalesHeader.Insert;
                        end;

                        DisposalLines.Reset;
                        DisposalLines.SetRange("Document No.", Rec.No);
                        if DisposalLines.FindSet then begin
                            repeat
                                "LineNo." := "LineNo." + 1;
                                /*FnCreateSalesline(SalesHeader."Document Type",
                                                  "LineNo.",DisposalLines."Fixed Asset/Item No."
                                                  ,1,1,SalesHeader."No.");*/
                                //ERROR('%1',SalesHeader."Document Type");
                                FnCreateSaleslineNew(DisposalLines, "LineNo.", SalesHeader."No.");
                            until DisposalLines.Next = 0;
                        end;
                        Rec."Sales Order Created" := true;
                        Rec.Modify;
                        Message('Sales Order No. %1 has been created', SalesHeader."No.");
                        CurrPage.Close;

                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Bidders_Promoted; Bidders)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
                actionref("Iniate Disposal Method_Promoted"; "Iniate Disposal Method")
                {
                }
                actionref("Create Sales Order_Promoted"; "Create Sales Order")
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        biddersvisible := false;
        if Rec.Status = Rec.Status::Approved then
            biddersvisible := true;
        Approvededit();
    end;

    trigger OnAfterGetRecord()
    begin
        biddersvisible := false;
        if Rec.Status = Rec.Status::Approved then
            biddersvisible := true;
        Approvededit();
    end;

    trigger OnOpenPage()
    begin
        biddersvisible := false;
        if Rec.Status = Rec.Status::Approved then
            biddersvisible := true;
        Approvededit();
    end;

    var
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        DisposalLines: Record "Disposal Lines";
        DisposalBidsPerLine1: Record "Disposal Bids Per Line 1";
        DisposalBidders: Record "Disposal Bidders";
        biddersvisible: Boolean;
        Editablex: Boolean;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        NoMgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
        "LineNo.": Integer;
        UserSetup: Record "User Setup";

    local procedure Approvededit()
    begin
        Editablex := false;
        if Rec.Status = Rec.Status::Open then
            Editablex := true;
    end;


    procedure FnCreateSalesline(Type: Option; "Lineno.": Integer; No1: Code[20]; Quantityl: Integer; "Unit price": Decimal; "DocumentNo.": Code[20])
    var
        SalesLine: Record "Sales Line";
        FADeBook: Record "FA Depreciation Book";
        UserSetup: Record "User Setup";
    begin
        with SalesLine do begin
            Init;
            "Document Type" := "document type"::Order;
            "Document No." := "DocumentNo.";
            "Line No." := "Lineno." + 1;

            Type := Type::"Fixed Asset";
            "No." := No1;
            FADeBook.Reset;
            FADeBook.SetRange("FA No.", "No.");
            if FADeBook.FindSet then
                FADeBook.CalcFields("Book Value");
            Validate("No.");
            Quantity := Quantityl;
            Validate(Quantity);
            "Unit Price" := FADeBook."Book Value";
            Validate("Unit Price");
            if UserSetup.Get(UserId) then begin
                "Shortcut Dimension 1 Code" := UserSetup."Shortcut Dimension 2 Code";
                "Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 3 Code";
                Validate("Shortcut Dimension 1 Code");
                Validate("Shortcut Dimension 2 Code");
            end;
            Insert;
        end;
    end;


    procedure FnCreateSaleslineNew(DisposalLine: Record "Disposal Lines"; "Lineno.": Integer; "DocumentNo.": Code[20])
    var
        SalesLine: Record "Sales Line";
        FADeBook: Record "FA Depreciation Book";
        UserSetup: Record "User Setup";
    begin
        with SalesLine do begin
            Init;
            "Document Type" := "document type"::Order;
            "Document No." := "DocumentNo.";
            "Line No." := "Lineno." + 1;
            if DisposalLine.Type = DisposalLine.Type::"Fixed Asset" then
                Type := Type::"Fixed Asset"
            else
                Type := Type::Item;
            "No." := DisposalLine."Fixed Asset/Item No.";
            if Type = Type::"Fixed Asset" then begin
                FADeBook.Reset;
                FADeBook.SetRange("FA No.", "No.");
                if FADeBook.FindSet then
                    FADeBook.CalcFields("Book Value");
            end;
            Validate("No.");
            Quantity := DisposalLine.Quantity;
            Validate(Quantity);
            "Unit Price" := DisposalLine."Estimated current value";
            Validate("Unit Price");
            if UserSetup.Get(UserId) then begin
                "Shortcut Dimension 1 Code" := UserSetup."Shortcut Dimension 2 Code";
                "Shortcut Dimension 2 Code" := UserSetup."Shortcut Dimension 3 Code";
                Validate("Shortcut Dimension 1 Code");
                Validate("Shortcut Dimension 2 Code");
            end;
            Insert;
        end;
    end;
}

#pragma implicitwith restore

