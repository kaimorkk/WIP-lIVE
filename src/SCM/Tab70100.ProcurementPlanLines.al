table 70100 "Procurement Plan Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Procurement Plan ID"; Code[20])
        {
            TableRelation = "Procurement Plan".Code;
        }
        field(2; "Planning Category"; Code[50])
        {
            TableRelation = "Procurement Category";

            trigger OnValidate()
            begin
                if ProcurementCategory.Get("Planning Category") then begin
                    Description := ProcurementCategory.Description;
                end;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(5; "Solicitation Type"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(6; "Procurement Method"; Option)
        {
            OptionCaption = ',Open Tender,RFQ,RFP,Two-Stage Tender,Design Competition Tender,Restricted Tender,Direct Procurement,Low Value Procurement,Force Account,Framework Agreement,Reverse Auction';
            OptionMembers = ,"Open Tender",RFQ,RFP,"Two-Stage Tender","Design Competition Tender","Restricted Tender","Direct Procurement","Low Value Procurement","Force Account","Framework Agreement","Reverse Auction";
        }
        field(7; "Primary Source of Funds"; Code[50])
        {
            TableRelation = "Funding Source";
        }
        field(8; "Total Quantity"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry".Quantity where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                       "Planning Category" = field("Planning Category"),
                                                                       Blocked = const(false)));
            Caption = 'Total Items';
            FieldClass = FlowField;
        }
        field(9; "Total Budgeted Cost"; Decimal)
        {
            CalcFormula = sum("Procurement Plan Entry"."Line Budget Cost" where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                                                 "Planning Category" = field("Planning Category"),
                                                                       Blocked = const(false)));
            FieldClass = FlowField;
        }
        field(10; "Total Actual Cost"; Decimal)
        {
        }
        field(11; "PP Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(12; "Requisition Product Group"; Option)
        {
            Description = 'New field used to categorize the Items further into Goods, Works, Services and Assets. NB: In most organizations, the Works, Services and Assets shall be setup under TYPE:SERVICE';
            OptionCaption = 'Goods,Services,Works,Assets';
            OptionMembers = Goods,Services,Works,Assets;
        }
        field(5701; "Budget Control Job No"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(5702; "Budget Control Job Task No."; Code[20])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Budget Control Job No"));
        }
        field(70000; "Document Type"; Option)
        {
            OptionCaption = 'Procurement Plan,Revision Voucher';
            OptionMembers = "Procurement Plan","Revision Voucher";
        }
        field(70001; "Total PRN Committments"; Decimal)
        {
            CalcFormula = sum("Purchase Line".Amount where("Procurement Plan ID" = field("Procurement Plan ID"),
                                                            "PP Planning Category" = field("Planning Category"),
                                                             Status = filter(<> 'Open'),
                                                             "Budget Line" = field("Planning Category"),
                                                            "Document Type" = const("Purchase Requisition")));
            FieldClass = FlowField;
        }

        field(80000; "AWP No"; Code[10])
        {
            TableRelation = "Annual Strategy Workplan".No;
        }
    }

    keys
    {
        key(Key1; "PP Line No", "Procurement Plan ID", "Document Type", "Planning Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    // trigger OnModify()
    // var
    //     myInt: Integer;
    //     Procplan: record "Procurement Plan";
    // begin
    //     if Rec."Procurement Plan ID" <> '' then begin
    //         Procplan.Reset();
    //         Procplan.SetRange(Code, Rec."Procurement Plan ID");
    //         Procplan.SetRange("Approval Status", Procplan."Approval Status"::Open);
    //         if not Procplan.FindFirst() then begin
    //             Error('You are not allowed to modify a %1 Procurement plan', Procplan."Approval Status");
    //         end;
    //     end;


    // end;

    var
        ProcurementCategory: Record "Procurement Category";
}

