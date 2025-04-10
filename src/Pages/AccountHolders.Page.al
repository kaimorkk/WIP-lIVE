Page 52193599 "Account Holders"
{
    PageType = Card;
    SourceTable = Vendor;
    SourceTableView = where("Debtor Type" = const("FOSA Account"),
                            "Group Account" = const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(GroupChairName; "Group Chair Name")
                {
                    ApplicationArea = Basic;
                }
                field(GroupSecName; "Group Sec. Name")
                {
                    ApplicationArea = Basic;
                }
                field(GroupTreasurerName; "Group Treasurer Name")
                {
                    ApplicationArea = Basic;
                }
                field(MeetingDays; "Meeting Days")
                {
                    ApplicationArea = Basic;
                }
                field(MeetingVenue; "Meeting Venue")
                {
                    ApplicationArea = Basic;
                }
                field(GroupAccount; "Group Account")
                {
                    ApplicationArea = Basic;
                }
                field(BalanceLCY; "Balance (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field(GroupLoanBalance; "Group Loan Balance")
                {
                    ApplicationArea = Basic;
                }
                field(GroupBalance; "Group Balance")
                {
                    ApplicationArea = Basic;
                }
                field(Status2; "Status 2")
                {
                    ApplicationArea = Basic;
                }
                field(NoofFemaleClients; "No. of Female Clients")
                {
                    ApplicationArea = Basic;
                }
                field(NoofMaleClients; "No. of Male Clients")
                {
                    ApplicationArea = Basic;
                }
                field(VendorPostingGroup; "Vendor Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            // part("Loans List"; "Loans Listx-Fosa")
            // {
            //     SubPageLink = Source = const(MICRO),
            //                   "Group Code" = field("No.");
            // }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    Vend.Reset;
                    Vend.SetRange(Vend."No.", "No.");
                    if Vend.Find('-') then begin
                        Gnljnline.Reset;
                        Gnljnline.SetRange("Journal Template Name", 'GENERAL');
                        Gnljnline.SetRange("Journal Batch Name", 'Statements');
                        Gnljnline.DeleteAll;
                        //end of deletion

                        GenBatches.Reset;
                        GenBatches.SetRange(GenBatches."Journal Template Name", 'GENERAL');
                        GenBatches.SetRange(GenBatches.Name, 'Statements');
                        if GenBatches.Find('-') = false then begin
                            GenBatches.Init;
                            GenBatches."Journal Template Name" := 'GENERAL';
                            GenBatches.Name := 'Statements';
                            GenBatches.Description := 'Statements';
                            GenBatches.Validate(GenBatches."Journal Template Name");
                            GenBatches.Validate(GenBatches.Name);
                            GenBatches.Insert;
                        end;
                        GLSetup.Get();
                        Gnljnline.Init;
                        Gnljnline."Journal Template Name" := 'GENERAL';
                        Gnljnline."Journal Batch Name" := 'Statements';
                        Gnljnline."Line No." := 10000 + Gnljnline."Line No.";
                        Gnljnline."Account Type" := Gnljnline."account type"::Vendor;
                        Gnljnline."Account No." := Vend."No.";
                        Gnljnline.Validate(Gnljnline."Account No.");
                        Gnljnline."Document No." := Vend."No.";
                        Gnljnline."Posting Date" := Today;
                        Gnljnline.Description := 'Account Statement';
                        Gnljnline.Amount := 100;
                        Gnljnline.Validate(Gnljnline.Amount);
                        Gnljnline."Bal. Account Type" := Gnljnline."bal. account type"::"G/L Account";
                        Gnljnline."Bal. Account No." := '500079';
                        Gnljnline.Validate(Gnljnline."Bal. Account No.");
                        Gnljnline."Shortcut Dimension 1 Code" := 'Micro';
                        Gnljnline.Validate("Shortcut Dimension 1 Code");
                        if Gnljnline.Amount <> 0 then
                            Gnljnline.Insert;
                        //Post Transaction
                        Gnljnline.Reset;
                        Gnljnline.SetRange(Gnljnline."Journal Template Name", 'General');
                        Gnljnline.SetRange(Gnljnline."Journal Batch Name", 'Statements');
                        Codeunit.Run(Codeunit::"Gen. Jnl.-Post", Gnljnline);
                        Modify;
                        Report.Run(51507358, true, true, Vend);
                    end;
                end;
            }
            separator(Action1000000040)
            {
            }
            action(List)
            {
                ApplicationArea = Basic;
                ShortCutKey = 'F5';
            }
            action("Ledger Entries")
            {
                ApplicationArea = Basic;
                RunObject = Page "Vendor Ledger Entries";
                RunPageLink = "Vendor No." = field("No.");
                RunPageView = sorting("Vendor No.");
            }
            action(Comments)
            {
                ApplicationArea = Basic;
                RunObject = Page "Comment Sheet";
                RunPageLink = "Table Name" = const(Vendor),
                              "No." = field("No.");
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                RunObject = Page "Default Dimensions";
                RunPageLink = "Table ID" = const(23),
                              "No." = field("No.");
            }
            action("Bank Accounts")
            {
                ApplicationArea = Basic;
                RunObject = Page "Vendor Bank Account Card";
                RunPageLink = "Vendor No." = field("No.");
            }
            action("Order Addresses")
            {
                ApplicationArea = Basic;
                RunObject = Page "Order Address";
                RunPageLink = "Vendor No." = field("No.");
            }
            action(Contact)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    ShowContact;
                end;
            }
            separator(Action1000000031)
            {
            }
            action(Statistics)
            {
                ApplicationArea = Basic;
                RunObject = Page "Vendor Statistics";
                RunPageLink = "No." = field("No."),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
            }
            action("Entry Statistics")
            {
                ApplicationArea = Basic;
                RunObject = Page "Vendor Entry Statistics";
                RunPageLink = "No." = field("No."),
                              "Date Filter" = field("Date Filter"),
                              "Global Dimension 1 Filter" = field("Global Dimension 1 Filter"),
                              "Global Dimension 2 Filter" = field("Global Dimension 2 Filter");
            }
            separator(Action1000000034)
            {
            }
            action("Cross References")
            {
                ApplicationArea = Basic;
                // //RunObject = Page "Cross References";
                // RunPageLink = "Cross-Reference Type"=const(Vendor),
                //               "Cross-Reference Type No."=field("No.");
                // RunPageView = sorting("Cross-Reference Type","Cross-Reference Type No.");
            }
            separator(Action1000000036)
            {
            }
            action("Loans Report")
            {
                ApplicationArea = Basic;
            }
        }
    }

    var
        CalendarMgmt: Codeunit "Calendar Management";
        PaymentToleranceMgt: Codeunit "Payment Tolerance Management";
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        PictureExists: Boolean;
        AccountSignatories: Record "Account Signatories";
        AccountSig: Record "Account Signatories";
        Vend: Record Vendor;
        cust: Record Customer;
        Gnljnline: Record "Gen. Journal Line";
        GenBatches: Record "Gen. Journal Batch";
        GLSetup: Record "General Ledger Setup";
        "BOSA Status": Option Active,"Non-Active",Blocked,Dormant,"Re-instated",Deceased,Withdrawal,Retired,Termination,Resigned,"Ex-Company",Casuals,"Family Member";
        cust1: Record Customer;
        Text001: label 'Do you want to allow payment tolerance for entries that are currently open?';
        Text002: label 'Do you want to remove payment tolerance from entries that are currently open?';


    procedure ActivateFields()
    begin
        //CurrForm.Contact.EDITABLE("Primary Contact No." = );
    end;
}

