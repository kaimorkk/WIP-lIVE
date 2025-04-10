Page 52193909 Bidders
{
    PageType = List;
    SourceTable = Bidders1;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ReceiptDate;"Tender Doc Receipt Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receipt Date';
                }
                field(ReceiptNo;"Receipt No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;"Tender Amount")
                {
                    ApplicationArea = Basic;
                    Caption = ' Amount';
                }
                field(BidSecurityAmount;"Bid Security Amount")
                {
                    ApplicationArea = Basic;
                }
                field(NoofCopiesSubmitted;"No. of Copies Submitted")
                {
                    ApplicationArea = Basic;
                }
                field(PhysicalAddress;"Physical Address")
                {
                    ApplicationArea = Basic;
                }
                field(PostalAddress;"Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(City;City)
                {
                    ApplicationArea = Basic;
                }
                field(Email;"E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(TelephoneNo;"Telephone No")
                {
                    ApplicationArea = Basic;
                }
                field(MobileNo;"Mobile No")
                {
                    ApplicationArea = Basic;
                }
                field(ContactPerson;"Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field(PreQualified;"Pre Qualified")
                {
                    ApplicationArea = Basic;
                }
                field(Successful;Successful)
                {
                    ApplicationArea = Basic;
                }
                field(FixedAssetNo;"Fixed Asset No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(Response;Response)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Bidders)
            {
                Caption = 'Bidders';
                action(MandatoryRequirementsCompliance)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mandatory Requirements -Compliance';
                    RunObject = Page "Bidder Mandatory Requirements";
                    RunPageLink = "Tender No"=field("Ref No."),
                                  "Company Name"=field(Name);

                    trigger OnAction()
                    begin
                        MandatoryReq.Reset;
                        MandatoryReq.SetRange(MandatoryReq."Tender No","Ref No.");
                        if MandatoryReq.Find('-') then
                        repeat
                          BidderMandatory."Tender No":="Ref No.";
                          BidderMandatory."Company Name":=Name;
                          BidderMandatory."Mandatory Requirement":=MandatoryReq."Mandatory Requirement";
                          if not BidderMandatory.Get(BidderMandatory."Tender No",BidderMandatory."Company Name",BidderMandatory."Mandatory Requirement")
                          then
                          BidderMandatory.Insert;

                        until MandatoryReq.Next=0;
                    end;
                }
                action(Bids)
                {
                    ApplicationArea = Basic;
                    Caption = 'Bids';
                    RunObject = Page "Tender Bids";
                    RunPageLink = "Requisition No"=field("Ref No."),
                                  "Bidder Name"=field(Name);

                    trigger OnAction()
                    begin
                        ProcurementLines.Reset;
                        ProcurementLines.SetRange(ProcurementLines."Requisition No","Ref No.");
                        if ProcurementLines.Find('-') then
                        repeat
                          TenderBids."Requisition No":="Ref No.";
                          TenderBids."Bidder Name":=Name;
                          TenderBids."Bidder Email":="E-mail";
                          TenderBids.Type:=ProcurementLines.Type;
                          TenderBids.No:=ProcurementLines.No;
                          TenderBids.Description:=ProcurementLines.Description;
                          if not TenderBids.Get(TenderBids."Requisition No",TenderBids."Bidder Name",TenderBids."Bidder Email") then
                          TenderBids.Insert;
                        until ProcurementLines.Next=0;
                    end;
                }
            }
        }
    }

    var
        MandatoryReq: Record "Tender Mandatory Requirements1";
        BidderMandatory: Record "Bidder Mandatory Requirements1";
        TenderBids: Record "Tender Bids";
        ProcurementLines: Record "Procurement Request Lines1";
}

