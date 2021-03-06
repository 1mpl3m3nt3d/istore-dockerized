import 'reflect-metadata';

import { inject, injectable } from 'inversify';

import type {
  PaginatedItemsDto,
  PaginatedItemsRequest,
  PaginatedItemsResponse,
  ProductDto,
} from '../dtos';
import { IoCTypes } from '../ioc';
import type { Product } from '../models';
import type { HttpService } from './HttpService';
import { ContentType, MethodType } from './HttpService';

export interface ProductsService {
  getById(id: number): Promise<Product>;
  getItems(request: PaginatedItemsRequest): Promise<PaginatedItemsResponse>;
}

@injectable()
export default class DefaultProductsService implements ProductsService {
  @inject(IoCTypes.httpService)
  private readonly httpService!: HttpService;

  private readonly catalogRoute = `${process.env.REACT_APP_CATALOG_CONTROLLER_ROUTE}`;

  public async getById(id: number): Promise<Product> {
    const result = await this.httpService.sendAsync<ProductDto>(
      `${this.catalogRoute}/getcatalogitembyid?id=${id}`,
      MethodType.POST
    );

    return result.data!;
  }

  public async getItems(
    request: PaginatedItemsRequest
  ): Promise<PaginatedItemsResponse> {
    const result = await this.httpService.sendAsync<PaginatedItemsDto>(
      `${this.catalogRoute}/getcatalogitems/`,
      MethodType.POST,
      { contentType: ContentType.Json },
      request
    );

    const data = result.data!.data;
    const total_pages = Math.ceil(
      Number(result.data!.count) / Number(request.pageSize)
    );

    return { data, total_pages };
  }
}
