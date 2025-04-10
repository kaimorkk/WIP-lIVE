Page 52194169 "Sick  Off"
{
    PageType = Card;
    SourceTable = "Sick Off1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(SickofNo;"Sick of No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "Sick Off List";
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(SickoffDateFrom;"Sick off Date(From)")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Sick Off Date(To)");
                        frmcalendar.RUNMODAL;
                        d := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF d <> 0D THEN
                          "Sick off Date(From)":= d;
                        VALIDATE("Sick off Date(From)");
                        */

                    end;
                }
                field(SickOffDateTo;"Sick Off Date(To)")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*
                        frmcalendar.SetDate("Sick Off Date(To)");
                        frmcalendar.RUNMODAL;
                        d := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF d <> 0D THEN
                          "Sick Off Date(To)":= d;
                        VALIDATE("Sick Off Date(To)");
                        */

                    end;
                }
                field(DaysTaken;"Days Taken")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Sickoffentitlement;"Sick off entitlement")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(HospitalName;"Hospital Name")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(PrintSickOffReport)
            {
                ApplicationArea = Basic;
                Caption = 'Print Sick Off Report';

                trigger OnAction()
                begin
                    Report.Run(51511209);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PrintSickOffReport_Promoted; PrintSickOffReport)
                {
                }
            }
        }
    }

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        empl: Record Employee;
        CountryRec: Record "Country/Region";
        CompanyInfo: Record "Company Information";
        VendorRec: Record Vendor;
        d: Date;
}

