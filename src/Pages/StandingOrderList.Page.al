Page 52193569 "Standing Order List"
{
    ApplicationArea = Basic;
    Caption = 'Standing Order List';
    CardPageID = "Standing Orders";
    Editable = false;
    PageType = List;
    SourceTable = "Standing Orders";
    SourceTableView = where(Status=filter(<>Active));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(SourceAccountNo;"Source Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(StaffPayrollNo;"Staff/Payroll No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationAccountType;"Destination Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationAccountNo;"Destination Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(DestinationAccountName;"Destination Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(BOSAAccountNo;"BOSA Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(EffectiveStartDate;"Effective/Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;Duration)
                {
                    ApplicationArea = Basic;
                }
                field(Frequency;Frequency)
                {
                    ApplicationArea = Basic;
                }
                field(DontAllowPartialDeduction;"Don't Allow Partial Deduction")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;"Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(TransactingBranch;"Transacting Branch")
                {
                    ApplicationArea = Basic;
                }
                field(AllocatedAmount;"Allocated Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Unsuccessfull;Unsuccessfull)
                {
                    ApplicationArea = Basic;
                }
                field(Balance;Balance)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                Visible = true;
            }
            systempart(Control1905767507;Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Vendor)
            {
                Caption = 'Ven&dor';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=const(Vendor),
                                  "No."=field("No.");
                }
            }
        }
    }


    procedure GetSelectionFilter(): Code[80]
    var
        Vend: Record Vendor;
        FirstVend: Code[30];
        LastVend: Code[30];
        SelectionFilter: Code[250];
        VendCount: Integer;
        More: Boolean;
    begin
        CurrPage.SetSelectionFilter(Vend);
        VendCount := Vend.Count;
        if VendCount > 0 then begin
          Vend.Find('-');
          while VendCount > 0 do begin
            VendCount := VendCount - 1;
            Vend.MarkedOnly(false);
            FirstVend := Vend."No.";
            LastVend := FirstVend;
            More := (VendCount > 0);
            while More do
              if Vend.Next = 0 then
                More := false
              else
                if not Vend.Mark then
                  More := false
                else begin
                  LastVend := Vend."No.";
                  VendCount := VendCount - 1;
                  if VendCount = 0 then
                    More := false;
                end;
            if SelectionFilter <> '' then
              SelectionFilter := SelectionFilter + '|';
            if FirstVend = LastVend then
              SelectionFilter := SelectionFilter + FirstVend
            else
              SelectionFilter := SelectionFilter + FirstVend + '..' + LastVend;
            if VendCount > 0 then begin
              Vend.MarkedOnly(true);
              Vend.Next;
            end;
          end;
        end;
        exit(SelectionFilter);
    end;


    procedure SetSelection(var Vend: Record Vendor)
    begin
        CurrPage.SetSelectionFilter(Vend);
    end;
}

