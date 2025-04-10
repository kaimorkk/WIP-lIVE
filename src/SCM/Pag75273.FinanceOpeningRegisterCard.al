

page 75273 "Finance Opening Register Card"
{
    PageType = Card;
    SourceTable = "Bid Opening Register";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Committee Code';
                    ToolTip = 'Specifies the value of the Tender Opening Committee Code field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Start Time field.';
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening End Date field.';
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening End Time field.';
                }
                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Venue field.';
                }
                field("Opening Person 1"; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 1 field.';
                }
                field("Opening Person 2"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 2 field.';
                }
                field("Opening Person 3"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 3 field.';
                }
                field("Opening Person 4"; Rec."Opening Person 4")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Person 4 field.';
                }
                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                    ToolTip = 'Specifies the value of the Lead Procurement Officer field.';
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Deadline field.';
                }
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Intention To Bid Vendor field.';
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submitted Bids field.';
                }
                field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Bid Security Amount (LCY) field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
            part(Control28; "Bid Opening Register Line")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup30)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(upperlimit(Code)),
                                  "IFS Code" = field("IFS Code");
                    ToolTip = 'Executes the Attendance Register action.';
                }
                action("Bid Opening Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Opening Tender Committee";
                    RunPageLink = "Document No." = field(Code);
                    ToolTip = 'Executes the Bid Opening Tender Committee action.';
                }
                action("Tender Opening Minutes")
                {
                    ApplicationArea = Basic;
                    Image = WIPEntries;
                    RunObject = Page "Tender Opening Summary Note";
                    RunPageLink = "Register ID" = field(Code);
                    ToolTip = 'Executes the Tender Opening Minutes action.';
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70040, true, true, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostDocument;
                    ToolTip = 'Executes the Post action.';
                    trigger OnAction()
                    begin
                        Procurement.PostBidOpeningRegister(Rec)
                    end;
                }
                action("Unseal Bid")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    ToolTip = 'Executes the Unseal Bid action.';
                    trigger OnAction()
                    begin
                        Procurement.UnsealFinancialBid(Rec);
                    end;
                }
                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Bid Opening Codes';
                    Image = OpenJournal;
                    ToolTip = 'Executes the Send Bid Opening Codes action.';
                    trigger OnAction()
                    begin
                        Procurement.FnSendSecretCodeOnIFSBidOpening(Rec)
                    end;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Send Bid Opening Codes_Promoted"; "Send Bid Opening Codes")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Tender Opening Minutes_Promoted"; "Tender Opening Minutes")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref("Unseal Bid_Promoted"; "Unseal Bid")
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Attendance Register_Promoted"; "Attendance Register")
                {
                }
                actionref("Bid Opening Tender Committee_Promoted"; "Bid Opening Tender Committee")
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Finance
    end;

    var
        Procurement: Codeunit "Procurement Processing";
}

#pragma implicitwith restore

