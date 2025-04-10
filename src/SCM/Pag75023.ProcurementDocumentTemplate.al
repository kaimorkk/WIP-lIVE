

page 75023 "Procurement Document Template"
{
    CardPageID = "Procurement Template Card";
    PageType = List;
    SourceTable = "Procurement Document Template";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Type"; Rec."Procurement Type")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
            group(ActionGroup9)
            {
                action(Registration)
                {
                    ApplicationArea = Basic;
                    Image = RegisteredDocs;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Registration);
                }
                action(Prequalification)
                {
                    ApplicationArea = Basic;
                    Image = QualificationOverview;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Prequalification);
                }
                action("EOI-Response")
                {
                    ApplicationArea = Basic;
                    Image = Return;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("EOI Response");
                }
                action("RFQ-Response")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("RFQ Response");
                }
                action("ITT Response")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("ITT Response");
                }
                action("Contract Issuance")
                {
                    ApplicationArea = Basic;
                    Image = ContractPayment;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter("Contract Issuance");
                }
                action(Transactional)
                {
                    ApplicationArea = Basic;
                    Image = TransferFunds;
                    RunObject = Page "Procurement Doc Template Line";
                    RunPageLink = "Template ID" = field("Template ID"),
                                  "Procurement Process" = filter(Transactional);
                }
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Registration_Promoted; Registration)
                {
                }
                actionref(Prequalification_Promoted; Prequalification)
                {
                }
                actionref("EOI-Response_Promoted"; "EOI-Response")
                {
                }
                actionref("RFQ-Response_Promoted"; "RFQ-Response")
                {
                }
                actionref("ITT Response_Promoted"; "ITT Response")
                {
                }
                actionref("Contract Issuance_Promoted"; "Contract Issuance")
                {
                }
                actionref(Transactional_Promoted; Transactional)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

