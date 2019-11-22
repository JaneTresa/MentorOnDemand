import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MentorhomeComponent } from './mentorhome.component';

describe('MentorhomeComponent', () => {
  let component: MentorhomeComponent;
  let fixture: ComponentFixture<MentorhomeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MentorhomeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MentorhomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
