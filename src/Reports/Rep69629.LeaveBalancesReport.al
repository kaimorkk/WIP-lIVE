report 52193739 "Leave Balances Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Leave Balances Report.rdlc';

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(logo; corec.Picture)
            {
            }
            column(name; corec.Name)
            {
            }
            column(No_Employee; Employee."No.")
            {
            }
            column(FirstName_Employee; Employee."First Name")
            {
            }
            column(MiddleName_Employee; Employee."Middle Name")
            {
            }
            column(LastName_Employee; Employee."Last Name")
            {
            }
            column(GlobalDimension2Code_Employee; Employee."Global Dimension 2 Code")
            {
            }
            dataitem("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
            {
                DataItemLink = "Staff No." = field("No.");
                DataItemTableView = where(Closed = const(false));
                RequestFilterFields = "Leave Type";
                column(LeaveType_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Type")
                {
                }
                column(EntryNo_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Entry No.")
                {
                }
                column(LeavePeriod_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Period")
                {
                }
                column(Closed_HRLeaveLedgerEntries; "HR Leave Ledger Entries".Closed)
                {
                }
                column(StaffNo_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Staff No.")
                {
                }
                column(StaffName_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Staff Name")
                {
                }
                column(PostingDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Posting Date")
                {
                }
                column(LeaveEntryType_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Entry Type")
                {
                }
                column(LeaveApprovalDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Approval Date")
                {
                }
                column(DocumentNo_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Document No.")
                {
                }
                column(ExternalDocumentNo_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."External Document No.")
                {
                }
                column(JobID_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Job ID")
                {
                }
                column(JobGroup_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Job Group")
                {
                }
                column(ContractType_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Contract Type")
                {
                }
                column(LeaveStartDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Start Date")
                {
                }
                column(LeavePostingDescription_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Posting Description")
                {
                }
                column(LeaveEndDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave End Date")
                {
                }
                column(LeaveReturnDate_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Return Date")
                {
                }
                column(GlobalDimension1Code_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Global Dimension 1 Code")
                {
                }
                column(GlobalDimension2Code_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Global Dimension 2 Code")
                {
                }
                column(LocationCode_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Location Code")
                {
                }
                column(UserID_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."User ID")
                {
                }
                column(SourceCode_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Source Code")
                {
                }
                column(JournalBatchName_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Journal Batch Name")
                {
                }
                column(ReasonCode_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Reason Code")
                {
                }
                column(IndexEntry_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Index Entry")
                {
                }
                column(NoSeries_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."No. Series")
                {
                }
                column(LeaveRecalledNo_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Recalled No.")
                {
                }
                column(DimensionSetID_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Dimension Set ID")
                {
                }
                column(LeavePostingType_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."Leave Posting Type")
                {
                }
                column(Noofdays_HRLeaveLedgerEntries; "HR Leave Ledger Entries"."No. of days1")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                SerialNo += 1;
            end;

            trigger OnPreDataItem()
            begin

                corec.Get;
                corec.CalcFields(corec.Picture);
                name := corec.Name;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        corec: Record "Company Information";
        SerialNo: Integer;
        name: Text;
}

