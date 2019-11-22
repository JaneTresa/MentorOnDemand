import { Pipe, PipeTransform } from '@angular/core';

import { UserHomeDetails } from './UserHomeDetails';
@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {
  transform(mentors: UserHomeDetails[], searchText: string): any[] {
    if(!mentors) return [];
    if(!searchText) return mentors;
searchText = searchText.toLowerCase();
return mentors.filter( it => {
      return it.name_of_skill.toLowerCase().includes(searchText);
    });
   }
}
