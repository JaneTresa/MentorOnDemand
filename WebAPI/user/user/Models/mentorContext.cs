using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace user.Models
{
    public partial class mentorContext : DbContext
    {
        public mentorContext()
        {
        }

        public mentorContext(DbContextOptions<mentorContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<Mentor> Mentor { get; set; }
        public virtual DbSet<MentorSkills> MentorSkills { get; set; }
        public virtual DbSet<Skills> Skills { get; set; }
        public virtual DbSet<Training> Training { get; set; }
        public virtual DbSet<UserDetails> UserDetails { get; set; }
        public virtual DbSet<Userhome> Userhome { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=mentor;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>(entity =>
            {
                entity.HasKey(e => e.AdId);

                entity.ToTable("admin");

                entity.Property(e => e.AdId).HasColumnName("ad_Id");

                entity.Property(e => e.AdPassword)
                    .HasColumnName("ad_Password")
                    .HasMaxLength(50);

                entity.Property(e => e.AdUsername)
                    .HasColumnName("ad_Username")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Mentor>(entity =>
            {
                entity.HasKey(e => e.Mid);

                entity.ToTable("mentor");

                entity.Property(e => e.Mid).HasColumnName("mid");

                entity.Property(e => e.Active)
                    .HasColumnName("active")
                    .HasMaxLength(20);

                entity.Property(e => e.LinkedinUrl)
                    .IsRequired()
                    .HasColumnName("linkedin_url")
                    .HasMaxLength(200);

                entity.Property(e => e.Mname)
                    .HasColumnName("MName")
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.RedDatetime)
                    .HasColumnName("red_datetime")
                    .HasColumnType("datetime");

                entity.Property(e => e.RegCode).HasColumnName("reg_code");

                entity.Property(e => e.UserName)
                    .IsRequired()
                    .HasColumnName("user_name")
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.YearsOfExperience).HasColumnName("years_of_experience");
            });

            modelBuilder.Entity<MentorSkills>(entity =>
            {
                entity.HasKey(e => e.MsId);

                entity.ToTable("mentor_skills");

                entity.Property(e => e.MsId).HasColumnName("ms_Id");

                entity.Property(e => e.Mid).HasColumnName("mid");

                entity.Property(e => e.MsFacilitiesOffered)
                    .HasColumnName("ms_Facilities_Offered")
                    .HasMaxLength(100);

                entity.Property(e => e.MsSelfRating)
                    .HasColumnName("ms_SelfRating")
                    .HasColumnType("decimal(3, 1)");

                entity.Property(e => e.MsTrainingDelivered).HasColumnName("ms_Training_Delivered");

                entity.Property(e => e.MsYearsOfExperience).HasColumnName("ms_Years_Of_Experience");

                entity.Property(e => e.SkId).HasColumnName("sk_Id");

                entity.HasOne(d => d.M)
                    .WithMany(p => p.MentorSkills)
                    .HasForeignKey(d => d.Mid)
                    .HasConstraintName("FK__mentor_skil__mid__1FCDBCEB");

                entity.HasOne(d => d.Sk)
                    .WithMany(p => p.MentorSkills)
                    .HasForeignKey(d => d.SkId)
                    .HasConstraintName("FK_mentor_skills_skills");
            });

            modelBuilder.Entity<Skills>(entity =>
            {
                entity.HasKey(e => e.SkId);

                entity.ToTable("skills");

                entity.HasIndex(e => e.SkName)
                    .HasName("UQ__skills__F639279DC6E5DC07")
                    .IsUnique();

                entity.Property(e => e.SkId).HasColumnName("sk_Id");

                entity.Property(e => e.SkDuration).HasColumnName("sk_Duration");

                entity.Property(e => e.SkName)
                    .IsRequired()
                    .HasColumnName("sk_Name")
                    .HasMaxLength(50);

                entity.Property(e => e.SkPrerequistes)
                    .HasColumnName("sk_Prerequistes")
                    .HasMaxLength(50);

                entity.Property(e => e.SkToc)
                    .IsRequired()
                    .HasColumnName("sk_TOC")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Training>(entity =>
            {
                entity.HasKey(e => e.TrId);

                entity.ToTable("training");

                entity.Property(e => e.TrId).HasColumnName("tr_Id");

                entity.Property(e => e.TrMId).HasColumnName("tr_mId");

                entity.Property(e => e.TrSId).HasColumnName("tr_sId");

                entity.Property(e => e.TrStatus)
                    .HasColumnName("tr_Status")
                    .HasMaxLength(20);

                entity.Property(e => e.TrUId).HasColumnName("tr_uId");

                entity.HasOne(d => d.TrM)
                    .WithMany(p => p.Training)
                    .HasForeignKey(d => d.TrMId)
                    .HasConstraintName("FK__training__tr_mId__24927208");

                entity.HasOne(d => d.TrS)
                    .WithMany(p => p.Training)
                    .HasForeignKey(d => d.TrSId)
                    .HasConstraintName("FK__training__tr_sId__25869641");

                entity.HasOne(d => d.TrU)
                    .WithMany(p => p.Training)
                    .HasForeignKey(d => d.TrUId)
                    .HasConstraintName("FK__training__tr_uId__239E4DCF");
            });

            modelBuilder.Entity<UserDetails>(entity =>
            {
                entity.HasKey(e => e.UserId);

                entity.ToTable("user_details");

                entity.Property(e => e.Active)
                    .HasColumnName("active")
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("First_Name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ForceResetPassword)
                    .HasColumnName("force_reset_password")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasColumnName("Last_Name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Pass)
                    .IsRequired()
                    .HasMaxLength(15)
                    .IsUnicode(false);

                entity.Property(e => e.RegCode).HasColumnName("reg_code");

                entity.Property(e => e.RegDatetime)
                    .HasColumnName("reg_datetime")
                    .HasColumnType("datetime");
            });
        }
    }
}
