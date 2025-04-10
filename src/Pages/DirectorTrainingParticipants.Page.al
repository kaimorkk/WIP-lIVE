Page 52193445 "Director Training Participants"
{
    PageType = ListPart;
    SourceTable = "Training Participants";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                }
                field(SourceOfFunding; SourceOfFunding)
                {
                    ApplicationArea = Basic;
                    Caption = 'Source of Funding';
                }
                field(LocalOrAbroad; LocalOrAbroad)
                {
                    ApplicationArea = Basic;
                    Caption = 'Local or Abroad';
                }
                field(Institution; Institution)
                {
                    ApplicationArea = Basic;
                    Caption = 'Institution';
                }
                field(Venue; Venue)
                {
                    ApplicationArea = Basic;
                    Caption = 'Venue';
                }
                field(Country; Country)
                {
                    ApplicationArea = Basic;
                    Caption = 'Country';
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                    Caption = 'Currency';
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                }
                field(StartDate; StartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'End Date';
                }
                field(TuitionDays; TuitionDays)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                }
                field(TravelDate; TravelDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date of Travel';
                }
                field(ReturnDate; ReturnDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Return Date';
                }
                field(PerDiemDays; PerDiemDays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Per Diem Days';
                }
                field(NeedSource; "Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(TrainingNeedDescription; "Training Need Description")
                {
                    ApplicationArea = Basic;
                }
                field(PerDiemDistribution; "Per Diem Distribution")
                {
                    ApplicationArea = Basic;
                    Caption = 'Per Diem Distribution';
                }
                field(TuitionFeeDistribution; "Tuition Fee Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(AirTicketDistribution; "Air Ticket Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(ImprestDistribution; "Imprest Distribution")
                {
                    ApplicationArea = Basic;
                }
                field(TravelDocumentsFeesDistribution; "Travel Docs Fees Dstrbtn")
                {
                    ApplicationArea = Basic;
                    Caption = 'Travel Documents Fees Distribution';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Training.Reset;
        if Training.Get("Training Request") then begin

            SourceOfFunding := Training."Source of Funding";
            LocalOrAbroad := Training."Local or Abroad";
            Institution := Training."Training Insitution";
            Venue := Training.Venue;
            Country := Training."Country Code";
            Currency := Training.Currency;
            Title := Training."Course Title";
            StartDate := Training."Planned Start Date";
            EndDate := Training."Planned End Date";
            TuitionDays := Training."No. Of Days";
            TravelDate := Training."Date of Travel";
            ReturnDate := Training."Return Date";
            PerDiemDays := Training."Per Diem Days";

        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Training.Reset;
        if Training.Get("Training Request") then begin

            SourceOfFunding := Training."Source of Funding";
            LocalOrAbroad := Training."Local or Abroad";
            Institution := Training."Training Insitution";
            Venue := Training.Venue;
            Country := Training."Country Code";
            Currency := Training.Currency;
            Title := Training."Course Title";
            StartDate := Training."Planned Start Date";
            EndDate := Training."Planned End Date";
            TuitionDays := Training."No. Of Days";
            TravelDate := Training."Date of Travel";
            ReturnDate := Training."Return Date";
            PerDiemDays := Training."Per Diem Days";

        end;
    end;

    var
        Training: Record "Training Request1";
        SourceOfFunding: Option "CMA Funded","Partner Funded","Self Funded";
        Institution: Text[150];
        Venue: Text[150];
        Country: Code[30];
        Currency: Code[20];
        Title: Text[150];
        StartDate: Date;
        EndDate: Date;
        TuitionDays: Decimal;
        TravelDate: Date;
        ReturnDate: Date;
        PerDiemDays: Decimal;
        LocalOrAbroad: Option "Local",Abroad;
}

